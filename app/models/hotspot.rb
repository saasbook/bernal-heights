class Hotspot < ActiveRecord::Base
    has_many :hotspotissues
    has_many :issues, :through => :hotspotissues
    
    validates :location, presence: true
    validates :occurred_time, presence: true
    validates :occurred_date, presence: true
    validates :details, presence: true
    validates :creator_name, presence: true
    validates :creator_email, presence: true
    validates :creator_number, presence: true
    
    geocoded_by :location
    after_validation :geocode
    
    def self.all_issues
        ['Car Break-In', 'Abandoned Car','Broken Streetlight', 'Illegal Drug Transactions','Litter/Dumping Trash','Public Drinking and Noise','Other']
    end
    
    def issue_types
        issue_types = ""
        self.issues.each do |issue|
            issue_types = issue_types + issue.issue_type
        end
        issue_types
    end
      
end
