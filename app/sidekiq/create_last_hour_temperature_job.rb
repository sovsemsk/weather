class CreateLastHourTemperatureJob
  include Sidekiq::Job

  def perform(*args)
    last_hour_temperature = AccuweatherLastHourFetcher.new.call
    Temperature.create(last_hour_temperature.data) if last_hour_temperature.status
  end
end
