class BookStoresController < ApplicationController
  before_action :set_book_store, only: [:show, :edit, :update, :destroy]

  # GET /book_stores
  # GET /book_stores.json
  def index
    @book_stores = BookStore.all
  end

  # GET /book_stores/1
  # GET /book_stores/1.json
  def show
  end

  # GET /book_stores/new
  def new
    @book_store = BookStore.new
  end

  # GET /book_stores/1/edit
  def edit
  end

  # POST /book_stores
  # POST /book_stores.json
  def create
    @book_store = BookStore.new(book_store_params)

    respond_to do |format|
      if @book_store.save
        format.html { redirect_to @book_store, notice: 'Book store was successfully created.' }
        format.json { render :show, status: :created, location: @book_store }
      else
        format.html { render :new }
        format.json { render json: @book_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_stores/1
  # PATCH/PUT /book_stores/1.json
  def update
    respond_to do |format|
      if @book_store.update(book_store_params)
        format.html { redirect_to @book_store, notice: 'Book store was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_store }
      else
        format.html { render :edit }
        format.json { render json: @book_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_stores/1
  # DELETE /book_stores/1.json
  def destroy
    @book_store.destroy
    respond_to do |format|
      format.html { redirect_to book_stores_url, notice: 'Book store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_store
      @book_store = BookStore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_store_params
      params.require(:book_store).permit(:title, :address)
    end
end
