class Hotspot < ActiveRecord::Base
    validates :issue_type, presence: true
    validates :location, presence: true
end
