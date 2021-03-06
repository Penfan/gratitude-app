class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
    @thank = Thank.new
  end

  def show
    @user = current_user
    @thanks = Thank.where(user_id: current_user).order(created_at: :desc).page(params[:page])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def destroy
    @user.destroy
  end

end
