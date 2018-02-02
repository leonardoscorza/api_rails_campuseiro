class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :manage, Event, user_id: user.id
      can :manage, Talk do |t|
        t.user_id == user.id || t.event.user_id == user.id
      end
      can :destroy, Comment do |c|
        c.user_id == user.id || c.commentable.user_id == user.id
      end
      can :create, Comment
      can :manage, TalkUser do |t|
        t.user_id == user.id || t.talk.user_id == user.id
      end
      can :manage, EventUser do |c|
        c.user_id == user.id || c.event.user_id == user.id
      end
      can [:update, :destroy], User, id: user.id
      can :create, User
    end
  end
end
