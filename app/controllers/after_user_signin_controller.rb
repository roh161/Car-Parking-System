class AfterUserSigninController < ApplicationController
  

  def index
    if user_signed_in?
      if current_user.user_type.downcase=='user'
        @user = User.find_by(params[:user_id])
        @vehicle = @user.vehicles.all
        if flash[:redirect]=='1'
          redirect_to root_path
        end
      else
        redirect_to after_admin_signin_index_path
      end
    end
  end

  def show
    if current_user.user_type.downcase=='user'
      @vehicle = current_user.vehicles.find(params[:id])  
    else
      redirect_to after_admin_signin_index_path
    end
  end


  def car_details
    if current_user.user_type.downcase=='user'
      @vehicle = @user.vehicles.find(params[:id])
    else
      redirect_to after_admin_signin_index_path
    end
  end

  def new
    if current_user.user_type.downcase=='user'
      @vehicle = current_user.vehicles.new
    else
      redirect_to after_admin_signin_index_path
    end
  end

  def create
    @vehicle = current_user.vehicles.build(vehicle_params)
    if @vehicle.save
      redirect_to after_user_signin_index_path
    else
      render 'new'   
    end
  end

  def edit
    @vehicle = current_user.vehicles.find(params[:id])
  end

  def update
    
    @vehicle = current_user.vehicles.find(params[:id])

    if @vehicle.update(vehicle_params)
      redirect_to after_user_signin_index_path
    end
  end

  def destroy
    
    @vehicle = current_user.vehicles.find(params[:id])
    @vehicle.destroy
    redirect_to after_user_signin_index_path
  end

  private
  def vehicle_params
      params.require(:vehicle).permit(:number, :car_model_name)
  end

end
