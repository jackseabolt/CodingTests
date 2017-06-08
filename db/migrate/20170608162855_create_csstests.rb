class CreateCsstests < ActiveRecord::Migration[5.0]
  def change
    create_table :csstests do |t|
      t.integer :score
      t.integer :user_id

      t.timestamps
    end
  end
end
