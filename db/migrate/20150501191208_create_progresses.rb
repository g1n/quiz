class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.string :user
      t.integer :level

      t.timestamps null: false
    end
  end
end
