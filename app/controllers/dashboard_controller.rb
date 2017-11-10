class DashboardController < ApplicationController
  before_action :auth_user
  layout 'site'


  def index
   @users = User.all
  end

 end