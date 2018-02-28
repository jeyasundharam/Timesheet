class Project < ApplicationRecord
    has_many :tasks, dependent: :destroy
    accepts_nested_attributes_for :tasks, allow_destroy: true
    validates :title, presence: true, uniqueness: true
    validates :description, presence: true
end
'#validates_presence_of :tasks
reject_if: proc { |attributes| attributes[title].blank? }'
