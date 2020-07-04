class BooksController < UsersController
    before_action :authenticate_user!
    before_action :user_check, only: [:edit, :update]
    def new
        @book = Book.new
    end
    def create
        @book = Book.new(book_params)
        @books = Book.page(params[:page]).reverse_order
        @book.user_id = current_user.id
        if @book.save
            flash[:notice] ="your post was successfully"
            redirect_to book_path(@book.id)
        else
            render "index"
        end
    end
    def index
        @books = Book.page(params[:page]).reverse_order
        @book = Book.new
    end
    def show
        @book_show = Book.find(params[:id])
        @book = Book.new
        @user = @book_show.user
    end
    def edit
        @book = Book.find(params[:id])
    end
    def update
        @book = Book.find(params[:id])
        @book.user_id = current_user.id
        if  @book.update(book_params)
            flash[:notice] ="your post was successfully"
            redirect_to book_path(@book.id)
        else
            render "edit"
        end
    end
    def destroy
        @book_show = Book.find(params[:id])
        @book_show.destroy
        redirect_to books_path
    end

private
    def book_params
        params.require(:book).permit(:user_id, :title, :body)
    end
    def user_check
        @book = Book.find(params[:id])
        if @book.user_id != current_user.id
            redirect_to books_path
        end
    end
end