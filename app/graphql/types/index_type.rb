# We need a way to create users. Users would be created by name, email and password.

module Types
    class IndexType < BaseEnum
        # the name is usually inferred by class name but can be overwritten
        graphql_name 'INDEX_ENUM'
        value "N", value: 0.000, description: "None"
        value "E", value: 1.000, description: "Equal importance"
        value "w", value: 1.3161, description: "Weak"
        value "M", value: 1.7321, description: "Moderate importance"
        value "M+", value: 2.2795, description: "Moderate plus"
        value "S", value: 3.000, description: "Strong importance"
        value "S+", value: 3.9482, description: "Strong plus"
        value "VS", value: 5.1962, description: "Very Strong or demonstrated importance"
        value "VSS", value: 6.8385, description: "Very, very strong"
        value "Ex", value: 9.0000, description: "Extreme importance"

    end
end
