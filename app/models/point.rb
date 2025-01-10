class Point < ApplicationRecord
    belongs_to :commentable, polymorphic: true
end
