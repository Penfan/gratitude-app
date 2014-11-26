class VisitorsController < ApplicationController
  def index
    @user = current_user
    @thanks = Thank.order(created_at: :desc).page(params[:page])
    @thank = Thank.new
  end
end
