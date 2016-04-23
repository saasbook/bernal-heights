class Event < ActiveRecord::Base
    validates :name, presence: true
    validates :start_date, presence: true
    validates :start_time, presence: true
    validates :location, presence: true
    validates :creator_name, presence: true
    validates :creator_email, presence: true
    
    def self.get_all_unconfirmed
        return Event.where(approved: false)
    end
    
    def self.get_all_approved
        return Event.where(approved: true)
    end

    def confirm
        self.approved = true
        self.save
    end
end
