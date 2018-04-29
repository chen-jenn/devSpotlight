class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new
      if user.permission_type == "admin" #super admin
        can :manage, :all
      else
        can :read, :all
      end

      alias_action :create, :read, :update, :destroy, to: :crud

      can(:crud, Organization) do |organization|
        # manager can change their own organization
        user == (organization.user.permission_type == "manager")
      end

      can(:crud, Events) do |event|
        user == ()
      end
  end
end
