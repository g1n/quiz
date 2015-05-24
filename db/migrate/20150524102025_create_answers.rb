class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :level
      t.text :value
      t.boolean :positive

      t.timestamps null: false
    end
  end
end
