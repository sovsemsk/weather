require 'grape-swagger'

class API < Grape::API
  format :json
  prefix :api
  version 'v1', using: :path

  # GET /api/v1/health
  get 'health' do
    { status: :ok }
  end

  mount Weather::Current
  mount Weather::Historical
  add_swagger_documentation
end