class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
  create_table :registrations do |t|
      t.string :semester, null: false
      t.integer :year, null: false
      t.integer :capacity, null: false
      t.boolean :is_open, default: false
      t.belongs_to :course, index: true, null: false
      t.bigint :teacher_id, index: true, null: false
      t.timestamps
    end

    add_foreign_key :registrations, :courses
    #other way of defining the foreign key. custom column
    add_foreign_key :registrations, :users, column: :teacher_id, primary_key: :id
    
  end
end



