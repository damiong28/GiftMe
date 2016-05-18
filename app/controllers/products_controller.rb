class ProductsController < ApplicationController

	def index
		@products = Product.paginate(:page=>params[:page],:per_page => 30)
	end

	def show
		@category = Category.where(:slug=> params[:category]).take
		@product = @category.products.find(params[:id])
	end

	def search
		@products = Product.search(params[:search]).paginate(:page=>params[:page],:per_page => 30)
	end

	private
    	# Use callbacks to share common setup or constraints between actions.
	    def set_product
	      @product = Product.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def product_params
	      params.require(:product).permit(:title, :price, :category_id, :img_url)
	    end

end
