class BooksController < ApplicationController
  def index
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book = Book.new  
    @books = Book.all  
  end
  
  def new
  end
  
  def create
  @book = Book.new(book_params)
  if @book.save
    flash[:notice] = 'successfully'
    redirect_to book_path(@book)  # show アクションにリダイレクト
  else
    @books = Book.all
    flash.now[:alert] = 'error'
    render :index
  end
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = 'successfully。'
    redirect_to books_path
  end

  def show
   @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'successfully'
      redirect_to book_path(@book)  # show アクションにリダイレクト
    else
      flash[:alert] = 'error'
      render :edit
    end
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
