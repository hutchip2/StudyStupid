class CreateFlashcards < ActiveRecord::Migration
  def change
    create_table :flashcards do |t|
      t.string :front
      t.string :back
      t.integer :deck_id
      t.timestamps
    end
    add_index :flashcards, :deck_id
  end
end
