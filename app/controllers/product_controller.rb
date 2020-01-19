class ProductController < ApplicationController
  def index
    @product=Product.all
  end

  def new
    @product=Product.new
  end
  def edit
    @product=Product.find(params[:id])
  end
  def create
    @product=Product.new(product_params)
    if @product.save
      flash[:notice]="new product succesfully added"
      redirect_to action:"index"
    else
      flash[:notice]="new product not added succesfully"
      render action:"new"
    end
  end
  def update
  @product =Product.find(params[:id])
  if @product.update_attributes(product_params)
    flash[:notice]="succesfully updated"
    redirect_to action:"index"
  else
    flash[:notice]="not updated"
    render action:"edit"
    end
  end
  def destroy
    @product=Product.find(params[:id])
    @product.destroy
    flash[:notice]="product deleted succesfully"
    redirect_to action:"index"
  end
  private
  def product_params
    params.require(:product).permit(:Pname,:Pcode,:Pstatus)
  end
end
