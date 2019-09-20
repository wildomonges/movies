# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # Ransack search with pagination
  def search
    q = model.ransack(params[:q])
    q.result(distinct: true).page(params[:page]).per(params[:per_page])
  end
end
