class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      @test_passage.update_passed
      TestsMailer.completed_test(@test_passage).deliver_now
      give_badges
      redirect_to result_test_passage_path(@test_passage), notice: t('.new_badges_html', url: my_badges_url) if reached_badges
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    service.call

    if service.success?
      @gist = Gist.create!(url: service.responce[:html_url], question: @test_passage.current_question, author: @test_passage.user)

      redirect_to @test_passage, notice: t('.success_html', url: @gist.url)
    else
      redirect_to @test_passage, notice: t('.failure')
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def reached_badges(user = current_user)
    badges = Badge.where(rule: "by_category", rule_value: @test_passage.test.category.title )
                 .or(Badge.where(rule: "by_level", rule_value: @test_passage.test.level))
                 .or(Badge.where(rule: "by_attempt", rule_value: @test_passage.test.title))

    badges.select { |badge| badge.reached?(user, @test_passage.test)}
  end

  def give_badges
    reached_badges.each { |badge| current_user.badges.push(badge)}
  end
end
