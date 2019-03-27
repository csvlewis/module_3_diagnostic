class NRELService
  def get_stations(zip)
    get_json('api/alt-fuel-stations/v1/nearest.json', zip)[:fuel_stations]
  end

  def get_json(url, zip)
    response = conn(zip).get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(zip)
    Faraday.new(url: 'https://developer.nrel.gov/') do |faraday|
      faraday.params['limit'] = '15'
      faraday.params['api_key'] = ENV['NREL_API_KEY']
      faraday.params['location'] = zip
      faraday.params['fuel_type'] = 'ELEC,LPG'
      faraday.params['access'] = 'public'
      faraday.adapter Faraday.default_adapter
    end
  end
end
