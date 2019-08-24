# We need a way to create users. Users would be created by name, email and password.

module Types
    class ScaleType < BaseEnum
        # the name is usually inferred by class name but can be overwritten
        graphql_name 'SCALE_ENUM'

        value "SAATY", value: "saaty", description: "The Saaty scale starting with 1 and ending at 9"
        value "INDEX", value: "index", description: "The index scale uses a floating point number to the 1,000th decimal place starting with 1.000 and ending at 9.000"
    end
end
