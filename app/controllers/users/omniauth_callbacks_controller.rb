class Users::OmniauthCallbacksController < ApplicationController
  Devise::OmniauthCallbacksController
  def passthru
    super
  end
  
  def sociallogin
       auth=request.env["omniauth.auth"]
       provider=auth.provider
       @user = User.from_omniauth(auth,session[:sign])
        if @user && session[:sign]==2
          sign_in @user
          flash[:notice]="Sign in Successful via #{provider}."
          redirect_to root_path  
       
        elsif session[:sign]==1
          redirect_to new_user_session_path, notice: 'Sign up successful via #{provider}.'     
        else
          redirect_to new_user_session_path, notice: 'You Must Signup Then signin.'
        end
  end

  # def github
  #     url=URI(request.referer || '').path
  #      puts "Request Url =#{request.url}" 
  #      @user = User.from_omniauth(request.env["omniauth.auth"],session[:sign])
  #       if @user && session[:sign]==2
  #         sign_in @user
  #         flash[:notice]="Sign in Successful via Github "
  #         redirect_to root_path
  #       elsif session[:sign]==1
  #         redirect_to new_user_session_path, notice: 'Sign up successful via github.'     
  #       else
  #         redirect_to new_user_session_path, notice: 'You Must Signup Then signin.'
  #       end
  #  end
  # def facebook
  #     @user = User.from_omniauth(request.env["omniauth.auth"],session[:sign])
  #       if @user && session[:sign]==2
  #         sign_in @user
  #         flash[:notice]="Sign in Successful via facebook "
  #         redirect_to root_path
  #       elsif session[:sign]==1
  #         redirect_to new_user_session_path, notice: 'Sign up successful via facebook.'
  #       else
  #         redirect_to new_user_session_path, notice: 'You Must Signup Then signin.'
  #       end
  #  end
  #  def google_oauth2
  #      @user = User.from_omniauth(request.env["omniauth.auth"],session[:sign])
  #      if @user && session[:sign]==2
  #         sign_in @user
  #         flash[:notice]="Sign in Successful via google"
  #         redirect_to root_path
  #       elsif session[:sign]==1
  #         redirect_to new_user_session_path, notice: 'Sign up successful via google.'
  #       else
  #         redirect_to new_user_session_path, notice: 'You Must Signup Then signin.'
  #       end
  # end
  def failure
         redirect_to root_path
  end
end
