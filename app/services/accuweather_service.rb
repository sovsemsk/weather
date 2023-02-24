class AccuweatherService < Service
  NOT_FOUND = :not_found
  NOT_FOUND_CODE = 404
  NOT_AUTHORIZED = :not_authorized
  NOT_AUTHORIZED_CODE = 401
  UNKNOWN = :unknown

  attr_accessor :api_host, :api_key

  def initialize
    config = Rails.application.config_for(:accuweather)
    credentials = Rails.application.credentials

    @api_host = config[:api_host]
    @api_key = credentials[:accuweather_api_key]
    super
  end

  private

  def not_found
    error(code: NOT_FOUND)
  end

  def not_authorized
    error(code: NOT_AUTHORIZED)
  end

  def unknown
    error(code: UNKNOWN)
  end
end