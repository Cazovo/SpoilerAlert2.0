class Replies < ActiveRecord::Base
    belongs_to :thread
    validates :spoiler, presence: true
end 