class ActionPlan < ActiveRecord::Base
  belongs_to :client
  has_many :goals, dependent: :destroy

  validates :description, presence: true
end
