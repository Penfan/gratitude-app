class VisitorsController < ApplicationController
  def index
    @user = current_user
    @thanks = Thank.all
    @thank = Thank.new
  end
end
