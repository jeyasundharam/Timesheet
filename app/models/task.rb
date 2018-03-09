class Task < ApplicationRecord
  belongs_to :project,required: false,optional: true
  validates :title, presence: true
  validates :taskdate, presence: true
  validates :hours,
             numericality: true,
            :inclusion => { :in => 0.5..8.0 ,:message => "Task Hours Not exceed 8 Hours"},
            :presence => true
end

# attr_accessor :tasks_attributes
# validate :total_hour,on: :create
# def total_hour
#   puts "Hours : #{hours}"
#   sum=0
#   puts "Sum #{sum}"
#   puts "tasks #{@tasks_attributes}"
#   tasks = @project.tasks_attributes
#   if sum > 8
#     errors.add(:tasks, "Total Hours can't be greater than 8 Hours")
#   elsif sum < 0
#     errors.add(:tasks, "Total Hours can't be less than Zero Hours")      
#   end
# end      