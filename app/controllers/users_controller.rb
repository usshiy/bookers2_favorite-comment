class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  
  def edit
    user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to user_path(current_user)
  end
    @user = User.find(params[:id])
    @introduction = @user.introduction
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully updated."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
