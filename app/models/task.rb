class Task < ApplicationRecord
  belongs_to :user
  
  validates :task_title, presence: true
  validates :task_detail, presence: true
end
