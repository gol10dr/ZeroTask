class List < ActiveRecord::Base
  
  validates :name, :presence => true
  
  has_many :tasks, :dependent => :destroy
  
end
