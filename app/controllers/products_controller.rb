class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy ]

  def index
    @products = Product.joins(:brand, :category)

    render json: @products
  end

  def show
    render json: @product
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(update_product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :sku, :stock, :status, :brand_id, :category_id)
    end

    def update_product_params
      params.require(:product).permit(:name, :description, :status)
    end
end
