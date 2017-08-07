class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new

    respond_to do |f|
    	f.html 
    	f.js
  	end
  end

  def create
    @products = Product.all
    @product = Product.create(product_params)

    respond_to do |f|
    	f.html 
    	f.js
  	end
  end

  def edit
    @product = Product.find(params[:id])

    respond_to do |f|
    	f.html 
    	f.js
  	end
  end

  def update
    @products = Product.all
    @product = Product.find(params[:id])

    @product.update_attributes(product_params)

    redirect_to products_url
  end

  def delete
    @product = Product.find(params[:product_id])

    respond_to do |f|
    	f.html 
    	f.js
  	end
  end

  def destroy
    @products = Product.all
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |f|
    	f.html 
    	f.js
  	end
  end

private
  def product_params
    params.require(:product).permit(:name, :price)
  end
end
