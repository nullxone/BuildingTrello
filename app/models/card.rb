class Card < ActiveRecord::Base
  belongs_to :list

  validates :title, :position, :list_id, presence: true

  module UpDown
    UP = "UP"
    DOWN = "DOWN"
  end

  def self.max_position
    Card.order(:position => :desc).first.position
  end

  def self.create_card(attr)
    card = Card.new(attr)
    card.position = Card.max_position + 1
    return card
  end

  def update_position(updown)
    p = self.position

    if updown == UpDown::UP
      if p != 0
        prev_card = Card.find_by(position: p - 1)
        self.update(position: p - 1)
        prev_card.update(position: p)
      end
    else
      if p != Card.max_position
        next_card = Card.find_by(position: p + 1)
        self.update(position: p + 1)
        next_card.update(position: p)
      end
    end
  end

  def delete_card
    Card.where("position > ?", self.position).each do |c|
      c.update(position: c.position - 1)
    end
    self.destroy
  end
end
