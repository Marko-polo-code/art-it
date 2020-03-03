class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
