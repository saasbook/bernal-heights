class Issue < ActiveRecord::Base
    has_many :hotspotissues
    has_many :hotspots, :through => :hotspotissues
end
