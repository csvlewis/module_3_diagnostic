class SearchFacade
  def initialize(zip)
    @zip = zip
  end

  def stations
    service.get_stations(@zip).map do |station_data|
      Station.new(station_data)
    end
  end

  def service
    NRELService.new
  end
end
