# frozen_string_literal: true

module JsonParserHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body, symbolize_names: true)
  end
end
