class CreateCharacters < ActiveRecord::Migration

  def change
    create_table :characters do |t|
      t.references :movie
      t.string :name
      t.string :gender
      t.boolean :is_human
      t.boolean :dies_in_movie
    end
  end
end