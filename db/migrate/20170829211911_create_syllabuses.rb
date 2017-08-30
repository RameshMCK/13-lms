class CreateSyllabuses < ActiveRecord::Migration[5.1]
  def change
    create_table :syllabuses do |t|
      
      t.string :title, null: false
      t.string :content
      t.string :file 
      t.string :url
      t.belongs_to :course, index: true, null: false
      
      t.timestamps
    end
    
    add_foreign_key :syllabuses, :courses
  end
end
