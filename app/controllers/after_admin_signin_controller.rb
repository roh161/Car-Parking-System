class AfterAdminSigninController < ApplicationController
    def index
        if user_signed_in?
            if current_user.user_type.downcase=='admin'
                @user = User.all
                @total_u = User.count()
                @total_v = Vehicle.count()
                if flash[:redirect]=='1'
                    redirect_to root_path
                end  
            else
                redirect_to after_user_signin_index_path
            end
        end
       
    end

    def vehicle    
        if current_user.user_type.downcase=='admin'
            @user = User.find_by(params[:user_id])
            @vehicle = Vehicle.all
            @vehicle = @user.vehicles.all  
        else
            redirect_to after_user_signin_index_path
        end
    end
    
    def show
        if current_user.user_type.downcase=='admin'
            @user = User.find(params[:id])
            @vehicle = @user.vehicles.count() 
        else
            redirect_to after_user_signin_index_path
        end
    end


    def update
        if current_user.user_type.downcase=='admin'
            redirect_to after_admin_signin_path 
        else
            redirect_to after_user_signin_index_path
        end
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
