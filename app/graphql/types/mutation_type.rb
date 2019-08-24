module Types
  class MutationType < Types::BaseObject

    field :create_decision_space, mutation: Mutations::CreateDecisionSpace
    field :create_user, mutation: Mutations::CreateUser
    field :signin_user, mutation: Mutations::SignInUser
    field :create_goal, mutation: Mutations::CreateGoal
    field :create_criterium, mutation: Mutations::CreateCriterium
    field :create_alternative, mutation: Mutations::CreateAlternative
    field :create_pairwise_comparison, mutation: Mutations::CreatePairwiseComparison
    field :create_judgement, mutation: Mutations::CreateJudgement
  end
end
