class UsersController < ApplicationController
  def show

  @user = User.find(params[:id])
  @books = Book.all
  @user_books = @user.books
  @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new

    # @user = User.find(params[:id])
    # @book = Book.new
  end


  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:success] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
    flash.now[:alert] = 'You have updated user error.'
    render :edit

    end

  end

 private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
