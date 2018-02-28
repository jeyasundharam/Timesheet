class Task < ApplicationRecord
  belongs_to :project,required: false,optional: true
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :hours, presence: true  
end

 