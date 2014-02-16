class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
