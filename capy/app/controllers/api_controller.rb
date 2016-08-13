class ApiController < ApplicationController
  # Parse our request before dealing with it
  before_filter :parse_req

  # Assert we have the necessary properties
  before_filter only: create do
    unless @json.has_key?('type') && %w(SESSION DURATION).include?(@json.type) && @json.has_key?('data')
      render nothing: true,
             status: :bad_request
    end
  end

  def parse_req
    @json = JSON.parse(request.body.read)
  end
end
