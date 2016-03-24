class VisitorsController < ApplicationController
  def index
    if params[:sort] == 'alphabetical'
      @products = Product.alphabetical
    elsif params[:sort] == 'totaldiscount'
      @products = Product.totaldiscount
    else
      @products = Product.all
    end
  end
end
