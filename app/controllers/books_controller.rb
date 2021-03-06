class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       flash[:notice]="You have creatad book successfully."
       redirect_to book_path(@book.id)
    else
    @user = current_user
    @books = Book.all
    render :index
    end
  end
  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end
  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
        render :edit
    else
        redirect_to books_path
    end
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice]="Book was successfully updated."
     redirect_to book_path(@book.id)
    else
     render :edit
    end
  end
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to index  # 投稿一覧画面へリダイレクト
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  def user_params
        params.require(:user).permit(:name,:profile_image,:introduction)
  end
end
