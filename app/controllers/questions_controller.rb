class QuestionsController < ApplicationController

  before_action :find_test, only: %w[index new create]
  before_action :find_question, only: %w[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: { questions: @test.questions.all }
  end

  def create
    question = @test.questions.build(question_params)

    if question.save
      render plain: 'Question created successfully'
    else
      render :new
    end
  end

  def new; end

  def show
    render plain: @question.body
  end

  def destroy
    @question.destroy
    render plain: 'Question deleted successfully'
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
