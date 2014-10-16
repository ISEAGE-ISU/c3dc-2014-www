class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :poster
      t.boolean :moderator
      t.boolean :administrator

      t.timestamps
    end
  end
end
