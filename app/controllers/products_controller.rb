class ProductsController < ApplicationController

	def index
		@products = Product.all.order("RANDOM()").paginate(:page=>params[:page],:per_page => 28)
	end

	def show
		@category = Category.where(:slug=> params[:category]).take
		@product = @category.products.find(params[:id])
	end

	def search
		@products = Product.search(params[:search]).paginate(:page=>params[:page],:per_page => 28)
	end

end
