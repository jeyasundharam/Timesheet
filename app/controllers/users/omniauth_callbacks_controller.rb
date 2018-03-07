class Users::OmniauthCallbacksController < ApplicationController

  Devise::OmniauthCallbacksController
  def passthru
    super
  end

  def github

       @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user
          sign_in @user
          redirect_to root_path
        else
          redirect_to new_user_session_path, notice: 'Access Denied.'
        end
   end
  def facebook

       @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user
          sign_in @user
          redirect_to root_path
        else
          redirect_to new_user_session_path, notice: 'Access Denied.'
        end
   end
   def google_oauth2
       @user = User.from_omniauth(request.env["omniauth.auth"])
       if @user
          sign_in @user
          redirect_to root_path
        else
          redirect_to new_user_session_path, notice: 'Access Denied.'
        end
  end




  def failure
    redirect_to root_path
  end
end
