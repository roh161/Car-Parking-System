class AfterUserSigninController < ApplicationController
  def index
    if flash[:redirect]=='1'
      redirect_to root_path
    end
    @user = User.find_by(params[:user_id])
    @vehicle = @user.vehicles.all
  end

  def show
    @vehicle = current_user.vehicles.find(params[:id])
  end


  def car_details
    @vehicle = @user.vehicles.find(params[:id])
  end

  def new
    @vehicle = current_user.vehicles.new
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
