# frozen_string_literal: true

class ErrorsController < ApplicationController
  def unauthorized
    respond_to do |format|
      format.json { render(json: { error: 'unauthorized' }, status: :unauthorized) }
      format.html { render(status: :unauthorized) }
    end
  end

  def forbidden
    respond_to do |format|
      format.json { render(json: { error: 'forbidden' }, status: :forbidden) }
      format.html { render(status: :forbidden) }
    end
  end

  def not_found
    respond_to do |format|
      format.json { render(json: { error: 'not_found' }, status: :not_found) }
      format.html { render(status: :not_found) }
    end
  end

  def internal_server_error
    respond_to do |format|
      format.json { render(json: { error: 'internal error' }, status: :internal_server_error) }
      format.html { render(status: :internal_server_error) }
    end
  end

  def service_unavailable
    respond_to do |format|
      format.json { render(json: { error: 'service_unavailable' }, status: :service_unavailable) }
      format.html { render(status: :service_unavailabler) }
    end
  end
end
