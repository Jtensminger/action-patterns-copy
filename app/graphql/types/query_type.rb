module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    
    # creating a query field for accessing all decision spaces
    field :all_decision_spaces, [DecisionSpaceType], null: false
    # resolver for query field all_decision_spaces
    def all_decision_spaces
     DecisionSpace.all
    #  Resolvers::Base
    end

    field :pairwise_comparison_generator, [PairwiseComparisonType], null: false do
      argument :decision_space_id, ID, required: true
    end

    def pairwise_comparison_generator(decision_space_id: nil)
      # TODO
      # Generalize This Too Take a Query Argument
      decision_space = DecisionSpace.find(decision_space_id)
      all_decision_space_goal = decision_space.goals[0]
      
      # We'll return at the end of the resolve function an array of questions
      all_pairwise_comparison = []
      

      #Get All Decision Space Criteria
      # We specify the order explicitly so that when we construct our matrix, it's always in the same order
      all_decision_space_criteria = decision_space.criteria.order(:created_at)
      all_decision_space_alternatives = decision_space.alternatives.order(:created_at)
      
      # We'll store all decision space criteria Ids here in a particular order so we can use it later to create our matrix
      criteria_ids_column_vector = []
      alternatives_ids_column_vector = []

      # gather the ID's from each criteria to store in our area
      all_decision_space_criteria.each do |n|
        criteria_ids_column_vector << n.id 
      end

      all_decision_space_alternatives.each do |a|
        alternatives_ids_column_vector << a.id 
      end

      # construct our ratio matrix that will hold all permutations of comparisons. You know what is stored in each x,y cordinate by referencing the
      # index location of each criterium in the criteria_ids_column_vector
      criteria_matrix = Matrix.build(criteria_ids_column_vector.length) {|row, col| [criteria_ids_column_vector[row], criteria_ids_column_vector[col]]}
      alternatives_matrix = Matrix.build(alternatives_ids_column_vector.length) {|row, col| [alternatives_ids_column_vector[row], alternatives_ids_column_vector[col]]}

      # Users only need to answer a small subset of the total permutations
      # This is because for each pairwise comparison instance they answer, we can generate it's reversed comparison in the matrix automatically
      criteria_below_diagonal_pairs = criteria_matrix.each(:strict_lower).to_a
      alternatives_below_diagonal_pairs = alternatives_matrix.each(:strict_lower).to_a

      # We only create pairwise comparisons explicitly for the questions we need users to answer explicitly.
      criteria_below_diagonal_pairs.each do |n|
        attributes = {
          goal_id: all_decision_space_goal.id,
          control_node_type: Types::NodeLayer.values["goal"].value,
          control_node_id: all_decision_space_goal.id,
          subordinate_nodes_type: Types::NodeLayer.values["criterium"].value,
          subordinate_node_one_id: n[0],
          subordinate_node_two_id: n[1]
        }
        
        decision_space.pairwise_comparisons.where(attributes).first_or_initialize do |c|
          if c.save
            all_pairwise_comparison << c
          end
        end
      end
      alternatives_below_diagonal_pairs.each do |n|
        attributes = {
          goal_id: all_decision_space_goal.id,
          control_node_type: Types::NodeLayer.values["goal"].value,
          control_node_id: all_decision_space_goal.id,
          subordinate_nodes_type: Types::NodeLayer.values["alternative"].value,
          subordinate_node_one_id: n[0],
          subordinate_node_two_id: n[1]
        }
        decision_space.pairwise_comparisons.where(attributes).first_or_initialize do |c|
          if c.save
            all_pairwise_comparison << c
          end
        end
      end
      # this is the array return type graphql is expecting from us via defined in the :field
      all_pairwise_comparison

    end

    

# Files can be resolved by the following ways:
  #method on the type (named as the field), which accepts arguments and can access object and context
  #GraphQL::Schema::Resolver - we are going discuss those in the next chapter
  #GraphQL::Function (previous version of resolvers, consider it depracated)


  end
end
