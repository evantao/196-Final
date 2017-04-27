class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name
      t.references :user

      t.timestamps 
    end
  end
end
