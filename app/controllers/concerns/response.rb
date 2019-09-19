module Response
  def json_response(object, success = true, status = :ok)
    render json: { success: success, body: object }, status: status
  end
end