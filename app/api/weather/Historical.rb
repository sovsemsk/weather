module Weather
  class Historical < Grape::API
    namespace :weather do
      desc 'Returns historical historical.'
      get :historical do
        history = Temperature.history
        present history, with: API::Weather::Entities::Temperature
      end

      namespace :historical do
        desc 'Returns historical max temperature.'
        get :max do
          max = Temperature.history_max
          { value: max }
        end

        desc 'Returns historical min temperature.'
        get :min do
          min = Temperature.history_min
          { value: min }
        end

        desc 'Returns historical avg temperature.'
        get :avg do
          avg = Temperature.history_avg
          { value: avg.to_f.round(2) }
        end
      end
    end
  end
end