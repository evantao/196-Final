class CreateAlbumsTests < ActiveRecord::Migration
  def change
    create_table :albums_tests do |t|
      t.references :album, index: true, foreign_key: true
      t.references :test, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
