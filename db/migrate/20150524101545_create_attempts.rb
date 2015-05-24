class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.integer :level
      t.text :value
      t.string :who
      t.datetime :when

      t.timestamps null: false
    end
  end
end
