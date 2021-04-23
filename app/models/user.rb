 class User < ActiveRecord::Base
    has_secure_password
    has_many :threads
    has_many :replies, through: :thread

    validates :username, :password, presence: true
    validates :username, uniqueness: true
end
