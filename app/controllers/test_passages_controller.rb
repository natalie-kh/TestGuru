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
      redirect_to result_test_passage_path(@test_passage)
      flash[:notice] = t('.new_badges_html', url: my_badges_url) if @new_badges.any?
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

  def give_badges
    @new_badges = BadgeService.new(@test_passage).badges
    current_user.badges << @new_badges
  end
end
