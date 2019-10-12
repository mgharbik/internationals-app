class Friendship < ApplicationRecord
  belongs_to :international_1, class_name: 'International'
  belongs_to :international_2, class_name: 'International'

  validates :international_1, presence: true
  validates :international_2, presence: true
  validate :check_friendship, if: -> { international_1_id? && international_2_id? }

  private

  def check_friendship
    errors.add(:base, 'Already friends') if international_1.friends.include?(international_2)
  end
end
