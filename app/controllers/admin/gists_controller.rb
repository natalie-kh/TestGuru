class Admin::GistsController < Admin::BaseController
  before_action :set_gist, only: %w[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_gist_not_found

  def index
    @gists = Gist.all
  end

  def show; end

  private

  def set_gist
    @gist = Gist.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Gist not found'
  end
end