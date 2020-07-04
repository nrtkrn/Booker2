class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        @users = User.page(params[:page]).reverse_order
        @books = Book.page(params[:page]).reverse_order
        @book = Book.new
    end
    def show
        @user = User.find(params[:id])
        @books = @user.books.page(params[:page]).reverse_order
        @book = Book.new
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        @user.id = current_user.id
        if @user.update(user_params)
            flash[:notice] ="your post was successfully"
            redirect_to user_path(@user.id)
        else
            render "edit"
        end
    end

    private 
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
