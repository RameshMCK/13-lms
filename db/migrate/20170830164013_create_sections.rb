class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.string :title, defaut: 'Untitled'
      t.text :content
      t.string :azure
      t.string :link
      t.integer :position, default: 0
      t.belongs_to :course, index: true, null: false
      t.timestamps
    end

    add_foreign_key :sections, :courses
  end
end
