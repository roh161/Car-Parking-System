class AfterAdminSigninController < ApplicationController

    def index
        @user = User.all
        if flash[:redirect]=='1'
            redirect_to root_path
        end
    end

    def show 
        @user = User.find(params[:id])
        @vehicle = @user.vehicles.count()
    end

    def edit
        # @user = User.find(params[:id])
    end

    def update

    end
    def delete
        @user = User.find(params[:id])
    end
      
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to after_admin_signin_path
    end


end
