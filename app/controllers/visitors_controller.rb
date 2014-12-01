class VisitorsController < ApplicationController
  def index
    @user = current_user || User.new
    @group = Group.new
    @usr_groups = []
    @user.thanks.each do |t| 
      @usr_groups.append(t.groups)
    end
    # @thanks = Thank.connection.select_all('SELECT * FROM thank WHERE (@user IN thank.users)').order(created_at: :desc).page(params[:page])
    # @thanks = Thank.where("all_vis = ?", true).merge(Thank.joins(:users).where(users: @user))
    Group.joins(:user)
    temp = (Thank.where("all_vis = ?", true) + Thank.where("user_id = ?", @user)).map(&:id) + @user.groups.pluck(:thank_id)
    @thanks = Thank.where('id in (?)',temp).uniq.order(created_at: :desc).page(params[:page])
    # @thanks = @thanks.uniq.order(created_at: :desc).page(params[:page])
    @thank = Thank.new
  end
end
