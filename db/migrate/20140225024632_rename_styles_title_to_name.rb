class RenameStylesTitleToName < ActiveRecord::Migration
  def change
  		rename_column :styles, :title, :name
  end
end
