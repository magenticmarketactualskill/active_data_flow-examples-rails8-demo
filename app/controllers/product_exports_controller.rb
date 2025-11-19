# frozen_string_literal: true

class ProductExportsController < ApplicationController
  def index
    @product_exports = ProductExport.order(exported_at: :desc)
  end
end
