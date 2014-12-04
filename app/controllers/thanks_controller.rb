class ThanksController < ApplicationController
  def new
    @user = User.find params[current_user]
    @thank = @user.thanks.build
  end

  def create
    @thank = Thank.new thank_params
    @thank.user_id = current_user.id
    if @thank.save
      @group = Group.new(:users => params[:thank][:user_ids].keep_if { |u| u != ""}.map {|u| User.find(u)}, :name => "Temp")
      @group.thank_id = @thank.id
      if @group.save
        flash[:success] = 'Created!'
        redirect_to root_path
      else
        redirect_to root_path
      end
    else
      flash[:error] = 'Please enter a thanks!'
      redirect_to root_path
    end
  end

  def destroy
    @thank.destroy
  end

  def thank_params
    params.require(:thank).permit(:text, :user_id, :all_vis, :groups, :users, :groupname)
  end
end
