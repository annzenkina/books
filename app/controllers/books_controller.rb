class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @year_set = Set.new
    @year_set = Book.limit(1000).distinct.order(:year).pluck(:year)


    @author_set = Set.new
    @author_set = Book.limit(1000).distinct.order(:author).pluck(:author)

    @books = Book.page params[:page]

    if params[:year] && params[:year] != ""
      @books = @books.where(year: params[:year])
    end

    if params[:author] && params[:author] != ""
      @books = @books.where(author: params[:author])
    end

  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        flash[:notice] = 'Book was successfully created.'
        format.html { redirect_to @book }
        format.json { render :show, status: :created, location: @book }
      else
        flash[:warning] = 'Failed to save new book.'
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    books = Book.all.limit(100).where("title LIKE ?", "%" + params[:term] + "%")

    books_arr = books.map{ |book| {id: book.id, text: book.title}}
    books = {
      results: books_arr
    }
    render json: books
  end

  def author_search
    if !params[:term]
      params[:term] = ""
    end
      authors = Book.where("author LIKE ?", "%" + params[:term] + "%").distinct.pluck(:author)

      books_arr = authors.map{ |author| {id: author, text: author}}

      authors = {
        results: books_arr
      }
      render json: authors

  end

  def year_search
    if !params[:term]
      params[:term] = ""
    end
      years = Book.where("year LIKE ?", "%" + params[:term] + "%").distinct.pluck(:year)

      years_arr = years.map{ |year| {id: year, text: year}}

      years = {
        results: years_arr
      }
      render json: years

  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:id, :title, :author, :year)
    end

end
