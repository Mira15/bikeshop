class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET request, renders all products and condition for search box
  def index
    if params[:q]
      search_term = params[:q]
      if(Rails.env.development?)
        @products = Product.where("name LIKE ?", "%#{search_term}%")
      else
        @products = Product.where("name ilike ?", "%#{search_term}%")
      end
    else
      @products = Product.all
    end
  end

  # GET request, renders one product with comments and pagination
  def show  
    @comments = @product.comments.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
  end  

  # GET request, renders form for entering details for a new product
  def new
    @product = Product.new
  end

  # GET request, renders form for editing existing product
  def edit
  end

  # POST request, new product is saved in the database
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to '/caroussel', notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT request, product is updated in the database
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE request, product is destroyed from the database
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :colour, :price)
    end
end
