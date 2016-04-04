class Student < ActiveRecord::Base
  belongs_to :state
  belongs_to :grade
end
