# frozen_string_literal: true

# DataFlowsController handles manual triggering of DataFlow execution
# and displays DataFlow information
class DataFlowsController < ApplicationController
  # GET /data_flow
  # Shows ProductSyncFlow details and status
  def show
    @product_count = Product.active.count
    @export_count = ProductExport.count
    @last_export = ProductExport.order(exported_at: :desc).first
  end

  # POST /heartbeat
  # GET /heartbeat
  # Triggers DataFlow execution manually via NextHeartbeat scheduler
  # Uses DataFlowRun.pending.due scope to find runs ready for execution
  # Requirement 5: Manual DataFlow execution via HTTP
  def heartbeat
    begin
      Rails.logger.info("/heartbeat called")

      # Use the NextHeartbeat scheduler which queries DataFlowRun.pending.due
      result = ActiveDataFlow::Scheduler::NextHeartbeat.call
      
      @status = "success"
      @message = "Processed #{result[:processed_runs]} run(s): #{result[:success_count]} success, #{result[:error_count]} errors"
      @export_count = ProductExport.count
      
      respond_to do |format|
        format.html { redirect_to product_exports_path, notice: @message }
        format.json { 
          render json: { 
            status: @status, 
            message: @message, 
            export_count: @export_count,
            processed_runs: result[:processed_runs],
            success_count: result[:success_count],
            error_count: result[:error_count],
            timestamp: result[:timestamp]
          }, status: :ok 
        }
      end
    rescue StandardError => e
      # Log the error with full details (Requirement 8.5)
      Rails.logger.error("DataFlow execution failed: #{e.message}")
      Rails.logger.error(e.backtrace.join("\n"))
      
      @status = "error"
      @message = "Error executing DataFlow: #{e.message}"
      
      respond_to do |format|
        format.html { redirect_to root_path, alert: @message }
        format.json { render json: { status: @status, message: @message, error: e.message }, status: :internal_server_error }
      end
    end
  end
end
