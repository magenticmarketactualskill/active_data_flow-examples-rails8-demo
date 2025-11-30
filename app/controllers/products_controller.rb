# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.order(id: :asc)
  end

  def show
    @product = Product.find(params[:id])
  end
end
