require 'date'

class CoachEmail < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :text_message, dependent: :destroy
end