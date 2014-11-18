#encoding: utf-8

module CardsHelper
  def updown_buttons(card)
    r = ""
    if card.position != 0
      r << button_to('▲', update_position_card_path(card, updown: "UP"), :method => :post, :class => 'button-1')
    end
    if card.position != Card.max_position
      r << button_to('▼', update_position_card_path(card, updown: "DOWN"), :method => :post, :class => 'button-1')
    end
    r.html_safe
  end
end
