# == Schema Information
#
# Table name: registrations
#
#  id         :integer          not null, primary key
#  semester   :string           not null
#  year       :integer          not null
#  capacity   :integer          not null
#  is_open    :boolean          default(FALSE)
#  course_id  :integer          not null
#  teacher_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Registration < ApplicationRecord
    #validates :user_id, uniqueness: {scope: [:course_id, :semester, :year]}
    
      validates :semester, :year, :capacity, :course_id, :teacher_id, presence: true
      belongs_to :course
      belongs_to :teacher, foreign_key: :teacher_id, class_name: "User"
      
end
