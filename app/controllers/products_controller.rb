class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_store, only: [:index]
  before_action :set_product, only: [:show, :update]

  # GET /products?store_id=:store_id
  def index
    if @store
      @products = @store.products.select(:id, :name, :sku, :inventory_quantity, :inventory_updated_time, :store_id)
    else
      @products = Product.all
    end

    render json: @products
  end

  # GET /products/:id
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/:id
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/:id
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find_by(id: params[:store_id])
    end

    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :sku, :inventory_quantity, :inventory_updated_time, :store_id)
    end
end
