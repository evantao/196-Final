class CreateSongsTests < ActiveRecord::Migration
  def change
    create_table :songs_tests do |t|
      t.references :song, index: true, foreign_key: true
      t.references :test, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
