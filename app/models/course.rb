# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  subject    :string           not null
#  level      :integer          not null
#  credits    :integer          not null
#  syllabus   :string           default("no")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Course < ApplicationRecord
    validates :name, :subject, :level, :credits, presence: true
    has_many :registrations
    #has_many :syllabuses
    has_many :sections
end
