# frozen_string_literal: true

class ProductExportsController < ApplicationController
  def index
    @product_exports = ProductExport.order(product_id: :asc)
  end

  def purge
    count = ProductExport.count
    ProductExport.delete_all
    redirect_to product_exports_path, notice: "Purged #{count} product export(s)"
  end
end
