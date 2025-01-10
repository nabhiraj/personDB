class Job < ApplicationRecord
    has_many :points, as: "commentable", dependent: :destroy 
end
