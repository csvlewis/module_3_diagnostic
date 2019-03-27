require 'rails_helper'

describe SearchFacade do
  it 'exists' do
    facade = SearchFacade.new('80206')

    expect(facade).to be_a(SearchFacade)
  end

  context 'instance methods' do
    context '#stations' do
      it 'returns a list of the 15 stations closest to the searched zip code' do
        facade = SearchFacade.new('80206')

        expect(facade.stations.count).to eq(15)
        expect(facade.stations[0].name).to be_a(String)
        expect(facade.stations[0].address).to be_a(String)
        expect(facade.stations[0].fuel_type).to be_a(String)
        expect(facade.stations[0].distance).to be_a(Float)
        expect(facade.stations[0].access_times).to be_a(String)
      end
    end
  end
end
