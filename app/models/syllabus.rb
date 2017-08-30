# == Schema Information
#
# Table name: syllabuses
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  content    :string
#  file       :string
#  url        :string
#  course_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Syllabus < ApplicationRecord
    belongs_to :course
end
