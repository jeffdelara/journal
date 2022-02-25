class Task < ApplicationRecord
  validates :title, :description, :due, :presence => true 
  
  belongs_to :category
  belongs_to :user
end
