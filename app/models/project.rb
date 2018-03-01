class Project < ApplicationRecord
    has_many :tasks, dependent: :destroy
    accepts_nested_attributes_for :tasks, 
                                  allow_destroy: true
    validates :title, presence: true, length: { minimum: 5 }, uniqueness: true
    validates :description, presence: true
   end

# attr_accessor :tasks_attributes

# validate :total_hour,on: :create
# def total_hour
#   sum=0
#   @tasks_attributes.each do |j|
#      sum+=j["hours"].to_i 

#    end

#   if sum > 8
#     errors.add(:tasks, "Total Hours cant be greater than 8 Hours")
#   elsif sum < 0
#     errors.add(:tasks, "Total Hours cant be less than Zero Hours")      
#   end
# end      

