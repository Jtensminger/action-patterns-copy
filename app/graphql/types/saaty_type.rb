# We need a way to create users. Users would be created by name, email and password.

module Types
    class SaatyType < BaseEnum
        # the name is usually inferred by class name but can be overwritten
        graphql_name 'SAATY_ENUM'
        value "N", value: 0, description: "None"
        value "E", value: 1, description: "Equal importance"
        value "W", value: 2, description: "Weak"
        value "M", value: 3, description: "Moderate importance"
        value "M+", value: 4, description: "Moderate plus"
        value "S", value: 5, description: "Strong importance"
        value "S+", value: 6, description: "Strong plus"
        value "VS", value: 7, description: "Very Strong or demonstrated importance"
        value "VSS", value: 8, description: "Very, very strong"
        value "Ex", value: 9, description: "Extreme importance"

    end
end
