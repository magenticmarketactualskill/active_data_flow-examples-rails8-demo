# frozen_string_literal: true

class DataFlowsController < ApplicationController
  def show
    # Show ProductSyncFlow details
  end

  def heartbeat
    # Trigger the heartbeat to run DataFlows
    @message = "DataFlow execution triggered!"
    @status = "success"
    
    # TODO: Uncomment when ActiveDataflow gems are fully implemented
    # begin
    #   flow = ProductSyncFlow.new
    #   flow.run
    #   @message = "ProductSyncFlow executed successfully!"
    #   @export_count = ProductExport.count
    # rescue StandardError => e
    #   @status = "error"
    #   @message = "Error executing DataFlow: #{e.message}"
    # end
  end
end
