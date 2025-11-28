# frozen_string_literal: true

# DataFlowsController handles manual triggering of DataFlow execution
# and displays DataFlow information
class DataFlowsController < ActiveDataFlow::Runtime::DataFlowsController
  attr_accessor :product_count, :export_count, :last_export


  # GET /data_flow
  # Shows ProductSyncFlow details and status
  def show
    refresh
  end

  # Triggers DataFlow execution (as managed by inherited runtime)
  # POST /heartbeat_event
  # GET /heartbeat_event
  def heartbeat_event
    Rails.logger.info "[DataFlowsController.heartbeat_event] called"
    super
  end
end
