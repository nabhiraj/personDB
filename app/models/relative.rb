class Relative < ApplicationRecord
    belongs_to :person_1 , class_name: "Person"
    belongs_to :person_2, class_name: "Person"
end
