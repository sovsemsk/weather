class AccuweatherFixturesFetcher < AccuweatherService

  def call()
    send_request
  end

  protected

  def send_request
    uri = URI("#{@api_host}/currentconditions/v1/294021/historical/24?apikey=#{@api_key}&metric=true")
    http = Net::HTTP.new(uri.host, uri.port)
    req =  Net::HTTP::Get.new(uri)
    res = http.request(req)

    return not_found if res.code.to_i == NOT_FOUND_CODE
    return not_authorized if res.code.to_i == NOT_AUTHORIZED_CODE

    parsed_json = JSON.parse(res.body)

    success(
      parsed_json.map do |item|
        {
          unix_fixed_at: item['EpochTime'],
          fixed_at: item['LocalObservationDateTime'].to_datetime,
          value: item['Temperature']['Metric']['Value'].to_f
        }
      end
    )
  rescue StandardError => e
    unknown
  end
end