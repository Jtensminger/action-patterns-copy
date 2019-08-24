class User < ApplicationRecord
    has_secure_password #This mechanism requires you to have a password_digest attribute.
    has_many :decision_spaces
    has_many :pairwise_comparisons
    has_many :judgements
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end
