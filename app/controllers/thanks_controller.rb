class ThanksController < ApplicationController
  def new
    @user = User.find params[current_user]
    @thank = @user.thanks.build
  end

  def create
    @thank = Thank.new thank_params
    if @thank.save
      flash[:success] = 'Created!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @thank.destroy
  end

  def thank_params
    params.require(:thank).permit(:text, :user_id)
  end
end
