require 'rails_helper'

RSpec.describe Friendable do
  let!(:international) { create(:international) }
  let!(:international_2) { create(:international) }
  let!(:international_3) { create(:international) }
  let!(:international_4) { create(:international) }

  let!(:friendship) { create(:friendship, international_1: international, international_2: international_2) }
  let!(:friendship_2) { create(:friendship, international_1: international, international_2: international_3) }
  let!(:friendship_3) { create(:friendship, international_1: international_3, international_2: international_4) }

  describe '#friends_count' do
    subject { international.friends_count }

    it { is_expected.to eq(2) }
  end

  describe '#friends' do
    subject { international.friends }

    it { is_expected.to include(international_2, international_3) }
    it { is_expected.not_to include(international, international_4) }
  end

  describe '#suggested_friends' do
    subject { international.suggested_friends }

    it { is_expected.to include(international_4) }
    it { is_expected.not_to include(international, international_2, international_3) }
  end
end
