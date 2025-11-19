# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @product_count = Product.count
    @active_product_count = Product.where(active: true).count
    @export_count = ProductExport.count
  end
end
