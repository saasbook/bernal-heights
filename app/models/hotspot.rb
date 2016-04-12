class Hotspot < ActiveRecord::Base
    validates :issue_type, presence: true
    validates :location, presence: true
    validates :occurred_time, presence: true
    validates :occurred_date, presence: true
    validates :details, presence: true
    validates :creator_name, presence: true
    validates :creator_email, presence: true
    validates :creator_number, presence: true
    
    geocoded_by :location
    after_validation :geocode
end
