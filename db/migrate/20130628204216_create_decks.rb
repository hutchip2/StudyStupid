class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :title
      t.integer :account_id
      t.integer :current_flashcard_id, :default => 1
      t.timestamps
    end
  end
end
