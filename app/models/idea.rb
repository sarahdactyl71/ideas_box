class Idea < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :title, presence: true, uniqueness:true
  validates :description, presence: true
end
