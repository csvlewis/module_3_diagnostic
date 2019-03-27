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
        binding.pry
      end
    end
  end
end
