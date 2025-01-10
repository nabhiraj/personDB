class Education < ApplicationRecord
    has_many :points, as: "commentable", dependent: :destroy
end
