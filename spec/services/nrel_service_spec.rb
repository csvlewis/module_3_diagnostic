require 'rails_helper'

describe NRELService do
  it 'exists' do
    service = NRELService.new
    expect(service).to be_a(NRELService)
  end

  context 'instance methods' do
    context '#get_stations' do
      it 'returns a list of the 15 stations closest to the searched zip code' do
        service = NRELService.new
        result = service.get_stations('80206')

        expect(result).to be_a(Array)
        expect(result[0]).to have_key(:station_name)
        expect(result[0]).to have_key(:street_address)
        expect(result[0]).to have_key(:fuel_type_code)
        expect(result[0]).to have_key(:distance)
        expect(result[0]).to have_key(:access_days_time)
      end
    end
  end
end
