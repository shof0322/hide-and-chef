class Order < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :reservers
end
