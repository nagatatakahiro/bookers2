class UsersController < ApplicationController
  def show
		@book = Book.new
    @user = User.find(params[:id])
    @books = @user.books

  end
  
  def index
  end


  def edit
  end

  private

  def user_params
        params.require(:user).permit(:name,:profile_image,:introduction)
  end

end
