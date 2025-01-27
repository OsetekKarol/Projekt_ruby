class UsersController < ApplicationController
  def index
    @users = User.all  # Make absolutely sure this line is present and correct
  end
  

  def events # <--- New action
    @user = User.find(params[:id])
    @events = @user.events
  end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to users_path, notice: 'User created successfully!'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email)
    end
  end
  