class CreateCores < ActiveRecord::Migration
  def change
    create_table :cores do |t|
      t.string :name,     null: false
      t.string :core_id,  null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
