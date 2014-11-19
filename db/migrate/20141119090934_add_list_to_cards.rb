class AddListToCards < ActiveRecord::Migration
  def change
    add_reference :cards, :list, index: true
  end
end
