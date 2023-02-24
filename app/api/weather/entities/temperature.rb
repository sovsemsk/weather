module Weather
  module Entities
    class Temperature < Grape::Entity
      expose :value
      expose :fixed_at
    end
  end
end