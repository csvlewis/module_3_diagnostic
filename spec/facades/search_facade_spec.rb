require 'rails_helper'

describe SearchFacade do
  it 'exists' do
    facade = TutorialsFacade.new('80206')

    expect(facade).to be_a(TutorialsFacade)
  end
end
