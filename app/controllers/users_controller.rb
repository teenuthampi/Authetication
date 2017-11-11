class UsersController < ApplicationController
	
	def login
		if user_signed_in?
		  redirect_to dashboard_path 
		end
		  @user = User.new
	end

  def new_login_customer
		@user = User.new
		user = User.find_by_email(params[:user][:email])
    if user && user.valid_password?(params[:user][:password])
    	if !user.verification_code.nil?
			  redirect_to "/dashboard"
				sign_in user
				flash[:notice] = "You have logged in successfully!"
			else
			  flash[:notice] = "Your account is not verified, Please register and verify once again"
        render :sign_up
      end
    else
      flash[:notice] = "Invalid Credentials"
      render :login 
    end
	end
 
  def sign_up
  	@user = User.new
  end

	def new_customer
		@user = User.new(user_params)
	  	if @user.save
	  		@user.send_confirmation_email
	  		flash[:notice] = 'You have been registered successfully. Please login to your email to verify your account.'
	    	redirect_to "/verification/#{@user.id}"
	  	else
	  		flash[:notice] = "Invalid Credentials"
	      render :sign_up 
	  	end
	end

  def verification
  	@user = User.where(:id => params[:id]).first
  end

  def email_confirmation
	 @user = User.where(:id => params[:id]).first
   @verify_code = @user.update_attributes(:verification_code => params[:user][:verification_code])
   code = @user.verification_code
   if code == @user.email_verification_code
     redirect_to "/dashboard"
     sign_in @user
     flash[:notice] = "Your email address was verified successfully."
   else
     redirect_to "/verification/#{@user.id}"
     flash[:notice] = "Please enter the correct Verification Code."
    end
  end

  def check_email
      email_ids = User.pluck(:email)
      @boolean_value = email_ids.include?(params[:user][:email])
      respond_to do |format|
      format.json { render :json => !@boolean_value }
    end
  end

  private

  	def user_params
  		params.require(:user).permit(:email, :name, :password, :password_confirmation, :mobile_number,:email_verification_code)
  	end

end