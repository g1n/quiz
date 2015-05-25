class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :level
      t.text :content
	  t.string :qtype

      t.timestamps null: false
    end
  end
end
