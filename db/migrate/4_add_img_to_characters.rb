class AddImgToCharacters < ActiveRecord::Migration

  def change
  	add_column :characters, :img_src, :string
  end
end