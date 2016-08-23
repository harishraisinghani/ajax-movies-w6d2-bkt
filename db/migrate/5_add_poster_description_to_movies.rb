class AddPosterDescriptionToMovies < ActiveRecord::Migration

  def change
  	add_column :movies, :poster_src, :string
  	add_column :movies, :description, :string
  	add_column :movies, :running_time, :integer
  end
end