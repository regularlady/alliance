class Step < ActiveRecord::Base
  belongs_to :goal
  has_many :text_messages
end
