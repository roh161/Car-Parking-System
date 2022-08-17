class AfterAdminSigninController < ApplicationController

    def index
        @user = User.all
        @total_u = User.count()
        @total_v = Vehicle.count()
        if flash[:redirect]=='1'
            redirect_to root_path
        end  
    end

    def vehicle 
        @user = User.find_by(params[:user_id])
        @vehicle = Vehicle.all
        @vehicle = @user.vehicles.all
    end
    
    def show
        @user = User.find(params[:id])
        @vehicle = @user.vehicles.count()
    end


    def update
        redirect_to after_admin_signin_path
    end

    def delete
        @user = User.find(params[:id])
        @vehicle =Vehicle.find(params[:id])
    end
      
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to after_admin_signin_path
    end

    def search
        if params[:search].blank?
            redirect_to after_admin_signin_index_path and return
        else
            @parameter = params[:search].downcase
            @results = User.all.where("lower(name) LIKE :search",search: "%#{@parameter}%")  
        end
    end  
end
