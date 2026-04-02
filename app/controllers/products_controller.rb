class ProductsController < ApplicationController
# #   before_action :set_product, only: %i[ show edit update destroy ]
before_action :authenticate_user! , except: %i[ index show ]
#   # before_action :authenticate_user!, only: %i[ edit update destroy ]

# #  def current_user
 
# # end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Product created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "Product deleted successfully!"
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :featured_image)
      # params.expect(product: [ :name ])
    end
end
