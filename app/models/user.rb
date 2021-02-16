class User < ApplicationRecord
    has_many :plans

    # belongs_to :plans
    
    has_secure_password
end
