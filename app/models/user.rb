class User < ActiveRecord::Base
  rolify
  has_many :clients
  has_many :coach_emails
  before_save :set_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :title, presence: true
  validates :email, :presence => true

 def admin?
   role == 'admin'
 end

  def set_role
    self.add_role :member
  end
end
