class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit]

  def show
    @book=Book.find(params[:id])
    @new_book=Book.new
    @user=@book.user
  end
# current_user  User.find(current_user.id)
  def index
    @book=Book.new
    @books=Book.all
    @user=current_user
  end

  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have updated user successfully."
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      @user=User.find(current_user.id)
      render :index
    end
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      render :edit
    end
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    book=Book.find(params[:id])
    unless book.user_id==current_user.id
      redirect_to books_path
    end
  end
end
