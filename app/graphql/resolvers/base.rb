module Resolvers
    class Base < GraphQL::Schema::Resolver
        include SearchObject.module(:graphql)
    end
end