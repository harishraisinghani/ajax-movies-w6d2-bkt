class CreateMovies < ActiveRecord::Migration

  def change
    create_table :movies do |t|
      t.string :name
      t.integer :year
    end
  end
end