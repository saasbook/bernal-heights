class Event < ActiveRecord::Base
    validates :name, presence: true
    validates :start_date, presence: true
    validates :start_time, presence: true
    validates :location, presence: true
    validates :creator_name, presence: true
    validates :creator_email, presence: true
    
    def get_all_unconfirmed
        return Event.where(approved: false)
    end
end
