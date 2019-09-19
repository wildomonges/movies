# frozen_string_literal: true

module Response
  def json_response(object, status = :ok, success = true)
    render json: { success: success }.merge!(object), status: status
  end
end
