class Threads < ActiveRecord::Base
    belongs_to :user
    has_many :replies
    validates :title, presence: true
end