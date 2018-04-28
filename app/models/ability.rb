class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new
      if user.permission_type == 2 #super admin  
        can :manage, :all
      else
        can :read, :all
      end

      alias_action :create, :read, :update, :destroy, to: :crud

      can(:crud, Organization) do |organization|
        # manager can change their own organization
        user == (organization.user.permission_type == 1)
      end
  end
end
