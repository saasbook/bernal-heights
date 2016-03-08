class Hotspot < ActiveRecord::Base
    validates :issue_type, presence: true
    validates :location, presence: true
    validates :occurred_time, presence: true
    validates :details, presence: true
    validates :to_share, presence: true
    validates :contact_info, presence: true
    validates :creator_name, presence: true
    validates :creator_email, presence: true
    validates :creator_number, presence: true
end
