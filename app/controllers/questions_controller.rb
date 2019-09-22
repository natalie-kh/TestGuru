class QuestionsController < ApplicationController

  before_action :find_test, only: %w[index new create]
  before_action :find_question, only: %w[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @test = find_test
    @questions = @test.questions.all
  end

  def create
    @question = @test.questions.build(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def new
    @question = Question.new
  end

  def show
    render plain: @question.body
  end

  def destroy
    @question = find_question
    @test = @question.test

    @question.destroy
    redirect_to test_questions_path(@test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Object not found'
  end
end
