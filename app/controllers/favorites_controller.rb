class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    redirect_back(fallback_location: root_path)
    #redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)   # 直前のページに戻る　もし戻れなかったらroot_pathにもどる

    #redirect_to book_path(book)
  end
end
