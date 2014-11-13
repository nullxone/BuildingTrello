json.array!(@cards) do |card|
  json.extract! card, :id, :title, :description
  json.url card_url(card, format: :json)
end
