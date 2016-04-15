class Hotspotissue < ActiveRecord::Base
    belongs_to :hotspot
    belongs_to :issue
end
