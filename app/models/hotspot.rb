class Hotspot < ActiveRecord::Base
    validates :issue_type, presence: true
    validates :location, presence: true
    geocoded_by :location
    after_validation :geocode
end
