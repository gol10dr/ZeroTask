class Task < ActiveRecord::Base
  validates :description, :presence => true
  belongs_to :list
  scope :completed, where(:completed => true)
  scope :incomplete, where(:completed => false)
end
