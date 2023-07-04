class BooksController < ApplicationController
  before_action :set_user

  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    user = User.find(@book.user_id)
    unless user.id == current_user.id
    redirect_to books_path
  end
end

  def update
    @book = Book.find(params[:id])
    user = User.find(@book.user_id)
   unless user.id == current_user.id
    redirect_to books_path
  end
    
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    user = User.find(@book.user_id)
    redirect_to books_path unless user.id == current_user.id
    
    @book.destroy
    flash[:notice] = "Book was destroyed."
    redirect_to books_path
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = User.find(@book.user_id)
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def set_user
    @user = current_user
  end
end
