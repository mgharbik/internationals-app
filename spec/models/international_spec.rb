require 'rails_helper'

RSpec.describe International, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:country) }

  describe '#slug' do
    let(:international) { create(:international) }
    let(:expected_slug) { "#{international.name.parameterize}-#{international.country.parameterize}" }

    subject { international.slug }

    it { is_expected.to eq(expected_slug) }
  end
end
