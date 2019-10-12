class International < ApplicationRecord
  include Friendable

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  validates :name, presence: true
  validates :country, presence: true

  private

  def slug_candidates
    [
      %i[name country],
    ]
  end
end
