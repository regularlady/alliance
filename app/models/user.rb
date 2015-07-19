class User < ActiveRecord::Base
  has_many :clients
  has_many :coach_emails
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :title, presence: true
  validates :email, :presence => true
 
 def admin?
   role == 'admin'
 end
 
 def moderator?
   role == 'moderator'
 end
end
