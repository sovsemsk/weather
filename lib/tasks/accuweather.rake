namespace :accuweather do
  desc "Get last 12 hours data from Accuweather"
  task get_fixtures: :environment do
    begin
      fixtures_temperature = AccuweatherFixturesFetcher.new.call
      Temperature.create!(fixtures_temperature.data) if fixtures_temperature.status
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.warn "Data with same time already exist"
    end
  end
end
