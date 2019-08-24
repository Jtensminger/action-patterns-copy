# We need a way to create users. Users would be created by name, email and password.

module Types
    class NodeLayer < BaseEnum
        # the name is usually inferred by class name but can be overwritten
        graphql_name 'NODE_ENUM'

        value "GOAL", value: :goal, description: "The GOAL node in the network is the peak of the network with the CRITERIUM layer being directly below it."
        value "CRITERIUM", value: :criterium, description: "The CRITERIUM node in the network falls between the GOAL or top layer of nodes & the ALTERNATIVE or bottom layer of nodes. Occasionally there will be a SUBCRITERIUM layer between the CRITERIUM layer and the ALTERNATIVE layer."
        value "SUBCRITERIUM", value: :sub_criterium, description: "The SUBCRITERIUM node in the network falls between the CRITERIUM layer & the ALTERNATIVE layer."
        value "ALTERNATIVE", value: :alternative, description: "The ALTERNATIVE node is the last or bottom layer of the network with either CRITERIUM or SUBCRITERIUM nodes above it."

    end
end
