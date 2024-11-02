# frozen_string_literal: true

module RequestSpecHelper
  def json_body
    JSON.parse(response.body)
  end
end
