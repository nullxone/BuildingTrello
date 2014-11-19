class List < ActiveRecord::Base
  has_many :cards

  validates :name, presence: true

  def ordered_cards
    self.cards.order(:position)
  end
end
