class VisitorsController < ApplicationController
  def index
    @user = current_user || User.new
    @group = Group.new
    @usr_groups = []
    @user.thanks.each do |t| 
      @usr_groups.append(t.groups)
    end
    @thanks = Thank.order(created_at: :desc).page(params[:page])
    # @thanks = Thank.where("all_vis = ? OR users IN ?", true, @user).order(created_at: :desc).page(params[:page])
    @thank = Thank.new
  end
end
