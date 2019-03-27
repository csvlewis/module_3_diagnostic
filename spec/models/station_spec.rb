require 'rails_helper'

describe Station do
  it 'exists' do
    station = Station.new({station_name: 'Name', street_address: '123 Main St', fuel_type_code: 'ELEC', distance: 0.55, access_days_time: '24 hours daily'})
    expect(station).to be_a(Station)
    expect(station.name).to eq('Name')
    expect(station.address).to eq('123 Main St')
    expect(station.fuel_type).to eq('ELEC')
    expect(station.distance).to eq(0.55)
    expect(station.access_times).to eq('24 hours daily')
  end
end
