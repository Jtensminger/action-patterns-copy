require 'test_helper'

class Mutations::CreateDecisionSpaceTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateDecisionSpace.new(object: nil, context: {}).resolve(args)
  end

  test 'create a new decision space' do
    decision_space = perform(
      name: 'a purely hypothetical decision space',
      description: 'with no real implication on anything',
    )

    assert decision_space.persisted?
    assert_equal decision_space.name, 'a purely hypothetical decision space'
    assert_equal decision_space.description, 'with no real implication on anything'
  end
end