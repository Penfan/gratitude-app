class VisitorsController < ApplicationController
  def index
    @user = current_user || User.new
    @group = Group.new

    # @thanks = Thank.connection.select_all('SELECT * FROM thank WHERE (@user IN thank.users)').order(created_at: :desc).page(params[:page])
    # @thanks = Thank.where("all_vis = ?", true).merge(Thank.joins(:users).where(users: @user))
    @usr_groups = @user.in_which_groups
    @thanks = @user.visible_thanks(params[:page])

    # @thanks = @thanks.uniq.order(created_at: :desc).page(params[:page])
    @thank = Thank.new
  end
end
