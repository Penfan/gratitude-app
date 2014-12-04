class VisitorsController < ApplicationController
  def index
    @user = current_user || User.new
    @group = Group.new

    # @thanks = Thank.connection.select_all('SELECT * FROM thank WHERE (@user IN thank.users)').order(created_at: :desc).page(params[:page])
    # @thanks = Thank.where("all_vis = ?", true).merge(Thank.joins(:users).where(users: @user))

    @thanks = @user.visible_thanks

    # @thanks = @thanks.uniq.order(created_at: :desc).page(params[:page])
    @thank = Thank.new
  end
end
