class Task < ApplicationRecord
  belongs_to :project,required:false
end
