class Step < ActiveRecord::Base
  belongs_to :goal
  has_many :text_messages

  validates :description, presence: true
end
