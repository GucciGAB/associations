class User < ApplicationRecord
    has_one :profile, dependent: :destroy
    accepts_nested_attributes_for :profile
end
