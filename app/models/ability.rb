class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard
      can :manage, :all
    else
      can :read, :all                   # allow everyone to read everything
    end
  end
end
