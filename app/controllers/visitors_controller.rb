class VisitorsController < ApplicationController
  def show
    @user = current_user
    @thanks = Thank.all
  end
end
