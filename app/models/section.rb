class Section < ApplicationRecord
    validates :course_id, presence: true
    belongs_to :course
end