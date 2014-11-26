class List < ActiveRecord::Base
  has_many :cards

  validates :name, presence: true

  def max_position
    self.cards.order(:position => :desc).first.try(:position) || -1
  end

  def ordered_cards
    self.cards.order(:position)
  end

end
