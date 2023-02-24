module Weather
  class Current < Grape::API
    namespace :weather do
      desc 'Returns current weather.'
      get :current do
        current = Temperature.current
        present current, with: API::Weather::Entities::Temperature
      end

      desc 'Returns weather by time'
      params do
        requires :timestamp, type: Integer
      end
      get :by_time do
        nearest = Temperature.find_by_sql ["SELECT * from temperatures order by ABS(unix_fixed_at - ?) LIMIT 1", params[:timestamp]]
        present nearest, with: API::Weather::Entities::Temperature
      end
    end
  end
end