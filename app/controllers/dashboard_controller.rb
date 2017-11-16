class DashboardController < ApplicationController
  before_action :auth_user
  layout 'site'


  def index
   @users = User.all
  end


  def upload_image
		@user = User.where(:id => params[:user][:id]).first
		@updated_image = @user.update_attributes(:image => params["user"]["image"])
	  redirect_to request.referer
	  flash[:notice] = "You have uploaded the profile picture for #{@user.name} successfully"
  end


	def remove_image     
   user = User.where(id: params[:id]).first 
   user.image.destroy
   redirect_to request.referer
   flash[:notice] = "You have changed the profile picture for #{user.name}, Please upload the new picture."
	end

end