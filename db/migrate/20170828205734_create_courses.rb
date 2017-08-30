class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :subject, null: false
      t.integer :level, null: false
      t.integer :credits, null: false
      t.string :syllabus , default: 'no'
      t.timestamps
    end
    add_index :courses, [:name], unique: true
  end
end
