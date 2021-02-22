class Story < ApplicationRecord
  validates :title, :author, presence:true
  validates_length_of :title, maximum: 60, allow_blank: false
end
