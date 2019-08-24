require 'search_object'
require 'search_object/plugin/graphql'
require 'graphql/query_resolver'

module Resolvers
    class DecisionSpacesSearch < Resolvers::Base
        # include SearchObject for GraphQL
        include SearchObject.module(:graphql)

        # scope is the starting point for search 
        scope { DecisionSpace.all }

        # the Type that we will return
        type types[Types::DecisionSpace]

        # inline input type definition for the advance filter
        class DecisionSpaceFilter < ::Types::BaseInputObject
            argument :OR, [self], required: false
            argument :description_contains, String, required: false
            argument :name_contains, String, required: false
        end

        # when "filter" is passed "apply_filter" would be called to narrow the scope
        option :filter, type: DecisionSpaceFilter, with: :apply_filter

        # apply_filter recursively loops through "OR" branches
        def apply_filter(scope, value)
            branches = normalize_filters(value).reduce { |a, b| a.or(b) }
            scope.merge branches
        end

        def normalize_filters(value, branches = [])
            scope = DecisionSpace.all
            scope = scope.where('description LIKE ?', "%#{value[:description_contains]}%") if value[:description_contains]
            scope = scope.where('name LIKE ?', "%#{value[:name_contains]}%") if value[:name_contains]

            branches << scope

            value[:OR].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?
            branches
        end
    end
end