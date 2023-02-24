class AccuweatherLastHourFetcher < AccuweatherService

  def call()
    send_request
  end

  protected

  def send_request
    uri = URI("#{@api_host}/currentconditions/v1/294021?apikey=#{@api_key}&metric=true")
    http = Net::HTTP.new(uri.host, uri.port)
    req =  Net::HTTP::Get.new(uri)
    res = http.request(req)

    return not_found if res.code.to_i == NOT_FOUND_CODE
    return not_authorized if res.code.to_i == NOT_AUTHORIZED_CODE

    parsed_json = JSON.parse(res.body)

    success({
              unix_fixed_at: parsed_json[0]['EpochTime'],
              fixed_at: parsed_json[0]['LocalObservationDateTime'].to_datetime,
              value: parsed_json[0]['Temperature']['Metric']['Value'].to_f
            })
  rescue StandardError => e
    unknown
  end
end