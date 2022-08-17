# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  def destroy
     super
      flash[:redirect]="1"
  end

  private

  def after_sign_in_path_for(resource)
    if current_user.user_type.upcase=="ADMIN"  
      after_admin_signin_index_path
    else current_user.user_type.upcase=="USER"
      after_user_signin_index_path
    end
  end
  end
