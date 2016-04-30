class Student < ActiveRecord::Base
  belongs_to :state
  belongs_to :grade

  validates :danbom, presence: true
  validates :name, presence: true
  validates :age, presence: true, numericality:
    { only_integer: true, greater_than: 0, less_than: 100 }
  validates :dojang, presence: true
  validates :teacher, presence: true
  validates :exam_age, presence: true, numericality:
    { only_integer: true, greater_than: 1900, less_than: 2100 }
end
