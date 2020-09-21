class Order < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :reservers

  with_options presence: true do
    validates :user_id, :course_id
  end
end
