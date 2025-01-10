class Person < ApplicationRecord
    has_many :points, as: "commentable", dependent: :destroy
    has_many :jobs
    has_many :educations
    has_many :relatives, foreign_key: "person_1_id"
    has_many :kin, through: :relatives, source: :person_2
end
