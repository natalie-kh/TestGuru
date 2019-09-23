class TestsController < ApplicationController

  before_action :find_test, only: %w[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions.all
  end

  def edit
    @test = find_test
  end

  def new
   @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :category_id, :author_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test not found'
  end
end
