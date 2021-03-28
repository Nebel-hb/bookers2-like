class BooksController < ApplicationController

  def new
   @book = Book.new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = "You have created book successfully."
      redirect_to  books_path
    else
      flash.now[:alert] = 'You have created book error.'
      render :new
    end

  end

  def index
    @books = Book.all
    @users = User.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    
  end
  def edit
     @user = User.find(params[:id])
     @book = Book.find(params[:id])
     @book_new = Book.new
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:success] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    flash.now[:alert] = 'You have updated book error.'
    render :edit
    end
  end
  

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path

  end

private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
