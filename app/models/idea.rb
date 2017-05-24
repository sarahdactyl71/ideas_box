class Idea < ApplicationRecord
  belongs_to :category
  validates :title, presence: true, uniqueness:true
  validates :description, presence: true
end
