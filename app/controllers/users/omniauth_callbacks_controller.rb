class Users::OmniauthCallbacksController < ApplicationController
  Devise::OmniauthCallbacksController
  def passthru
    super
  end

  def github

       @user = User.from_omniauth(request.env["omniauth.auth"],session[:sign])
        if @user
          sign_in @user
          flash[:notice]="Sign in Successful via Github "
          redirect_to root_path
        else
          redirect_to new_user_session_path, notice: 'You Must Signup Then signin.'
        end
   end
  def facebook
      @user = User.from_omniauth(request.env["omniauth.auth"],session[:sign])
        if @user
          sign_in @user
          flash[:notice]="Sign in Successful via facebook "
          redirect_to root_path
        else
          redirect_to new_user_session_path, notice: 'You Must Signup Then signin.'
        end
   end
   def google_oauth2
       @user = User.from_omniauth(request.env["omniauth.auth"],session[:sign])
       if @user
          sign_in @user
          flash[:notice]="Sign in Successful via google"
          redirect_to root_path
        else
          redirect_to new_user_session_path, notice: 'You Must Signup Then signin.'
        end
  end
  def failure
         redirect_to root_path
  end
end
