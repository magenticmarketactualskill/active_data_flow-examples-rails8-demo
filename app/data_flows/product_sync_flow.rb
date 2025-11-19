# frozen_string_literal: true

# ProductSyncFlow demonstrates ActiveDataflow functionality by syncing
# active products to an export table with data transformation.
#
# This DataFlow:
# - Reads from the products table (filtering active products)
# - Transforms price to cents and category to slug
# - Writes to the product_exports table
class ProductSyncFlow < ActiveDataflow::DataFlow
  def initialize(config = {})
    super
    @source = ActiveDataflow::Connector::Source::ActiveRecord.new(
      model: Product,
      scope: ->(relation) { relation.where(active: true) }
    )
    @sink = ActiveDataflow::Connector::Sink::ActiveRecord.new(
      model: ProductExport
    )
  end

  def run
    @source.each do |message|
      transformed = transform(message.data)
      @sink.write(transformed)
    end
  rescue StandardError => e
    Rails.logger.error("ProductSyncFlow error: #{e.message}")
    Rails.logger.error(e.backtrace.join("\n"))
    raise
  end

  private

  def transform(data)
    {
      product_id: data['id'],
      name: data['name'],
      sku: data['sku'],
      price_cents: (data['price'].to_f * 100).to_i,
      category_slug: data['category']&.parameterize,
      exported_at: Time.current
    }
  end
end
