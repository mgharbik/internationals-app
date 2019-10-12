require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it { should validate_presence_of(:international_1) }
  it { should validate_presence_of(:international_1) }

  describe '#check_friendship' do
    let!(:international) { create(:international) }
    let!(:international_2) { create(:international) }

    subject { build(:friendship, international_1: international, international_2: international_2)}

    it { is_expected.to be_valid }

    context 'when friendship exists' do
      let!(:friendship) { create(:friendship, international_1: international, international_2: international_2) }

      it { is_expected.not_to be_valid }
    end
  end
end
