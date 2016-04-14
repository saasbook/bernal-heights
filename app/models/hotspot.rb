class Hotspot < ActiveRecord::Base
    has_many :hotspotissues
    has_many :issues, :through => :hotspotissues
    
    validates :issue_type, presence: true
    validates :location, presence: true
    geocoded_by :location
    after_validation :geocode
end
