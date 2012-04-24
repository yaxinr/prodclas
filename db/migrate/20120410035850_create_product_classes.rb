class CreateProductClasses < ActiveRecord::Migration
  def change
    create_table :product_classes, :id=>false do |t|
      t.string :code, :limit=>10,  :null => false
      t.string :name, :limit=>512, :null => false

      t.timestamps
    end
    add_index :product_classes, :code, :unique => true
  end
end
