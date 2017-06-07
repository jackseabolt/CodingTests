class CreateJstests < ActiveRecord::Migration[5.0]
  def change
    create_table :jstests do |t|
      t.integer :score
      t.integer :user_id

      t.timestamps
    end
  end
end
