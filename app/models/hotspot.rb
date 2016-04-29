class Hotspot < ActiveRecord::Base
    has_many :hotspotissues
    has_many :issues, :through => :hotspotissues
    
    validates_presence_of :hotspotissues, :if => :active_or_basic_issue?
    validates :location, presence: true, :if => :active_or_basic_issue?
    validates :occurred_time, presence: true, :if => :active_or_issue_description?
    validates :occurred_date, presence: true, :if => :active_or_issue_description?
    validates :details, presence: true, :if => :active_or_issue_description?
    validates :creator_name, presence: true, :if => :active_or_personal_information?
    validates :creator_email, presence: true, :if => :active_or_personal_information?
    validates :creator_number, presence: true, :if => :active_or_personal_information?
    
    geocoded_by :location
    reverse_geocoded_by :latitude, :longitude, :address => :location
    after_validation :geocode, :reverse_geocode, :add_region, :if => lambda{ |obj| obj.location_changed? }
    
    def active?
      status == 'active'
    end
    
    def active_or_basic_issue?
      status.include?('basic_issue') || active?
    end
    
    def active_or_issue_description?
      status.include?('issue_description') || active?
    end
    
    def active_or_personal_information?
      status.include?('personal_information') || active?
    end
    def self.all_issues
        ['Car Break-In', 'Abandoned Car','Broken Streetlight', 'Illegal Drug Transactions','Litter/Dumping Trash','Public Drinking and Noise','Other']
    end
    
    def issue_types
        issue_types = ""
        self.issues.each do |issue|
            if issue_types == ""
              issue_types = issue.issue_type
            else
              issue_types = issue_types + ", " + issue.issue_type
            end
        end
        issue_types
    end
      
    def self.all_regions
      %w(North Central South-East South-West)
    end
   
    @@north_region = Geokit::Polygon.new([
      Geokit::LatLng.new(37.7468629,-122.4191523),
      Geokit::LatLng.new(37.7482117,-122.41832610000002),
      Geokit::LatLng.new(37.7483899,-122.4078012),
      Geokit::LatLng.new(37.7489668,-122.4062347),
      Geokit::LatLng.new(37.7494418,-122.40314480000002),
      Geokit::LatLng.new(37.7476773,-122.403574),
      Geokit::LatLng.new(37.7456073,-122.4039388),
      Geokit::LatLng.new(37.7444874,-122.40438940000001),
      Geokit::LatLng.new(37.742867,-122.4054516),
      Geokit::LatLng.new(37.7430866,-122.40758130000002),
      Geokit::LatLng.new(37.7431916,-122.4084449),
      Geokit::LatLng.new(37.7432462,-122.40902560000002),
      Geokit::LatLng.new(37.7432287,-122.40942389999998),
      Geokit::LatLng.new(37.7430781,-122.40941990000002),
      Geokit::LatLng.new(37.743101900000006,-122.4097162),
      Geokit::LatLng.new(37.743094,-122.41003670000002),
      Geokit::LatLng.new(37.7437441,-122.411811),
      Geokit::LatLng.new(37.7436767,-122.41214360000001),
      Geokit::LatLng.new(37.7436582,-122.4123018),
      Geokit::LatLng.new(37.743735,-122.4124668),
      Geokit::LatLng.new(37.7438034,-122.4127002),
      Geokit::LatLng.new(37.7438283,-122.413065),
      Geokit::LatLng.new(37.7438472,-122.41314349999999),
      Geokit::LatLng.new(37.7438894,-122.4132022),
      Geokit::LatLng.new(37.7439338,-122.4132367),
      Geokit::LatLng.new(37.7441651,-122.4132943),
      Geokit::LatLng.new(37.744138,-122.4144121),
      Geokit::LatLng.new(37.7442976,-122.4153582),
      Geokit::LatLng.new(37.7449923,-122.41519330000001),
      Geokit::LatLng.new(37.7459721,-122.41778970000001),
      Geokit::LatLng.new(37.7467484,-122.41828860000001),
      Geokit::LatLng.new(37.7468629,-122.4191523)
      ])
    
    @@central_region = Geokit::Polygon.new([
      Geokit::LatLng.new(37.7467822,-122.419163),
      Geokit::LatLng.new(37.7440313,-122.4210192),
      Geokit::LatLng.new(37.7411277,-122.4227894),
      Geokit::LatLng.new(37.73938,-122.4184871),
      Geokit::LatLng.new(37.7389579,-122.4145925),
      Geokit::LatLng.new(37.7424683,-122.4143887),
      Geokit::LatLng.new(37.7438384,-122.4133164),
      Geokit::LatLng.new(37.7440258,-122.4134332),
      Geokit::LatLng.new(37.7441496,-122.41337819999998),
      Geokit::LatLng.new(37.7441189,-122.4144389),
      Geokit::LatLng.new(37.744269,-122.4153998),
      Geokit::LatLng.new(37.7449286,-122.41533279999999),
      Geokit::LatLng.new(37.7460017,-122.4180203),
      Geokit::LatLng.new(37.7462266,-122.41809810000001),
      Geokit::LatLng.new(37.7466211,-122.4183047),
      Geokit::LatLng.new(37.7467822,-122.419163)
      ])
      
    @@south_east_region = Geokit::Polygon.new([
      Geokit::LatLng.new(37.7438087,-122.41327289999998),
      Geokit::LatLng.new(37.7435882,-122.4122858),
      Geokit::LatLng.new(37.7436603,-122.4117816),
      Geokit::LatLng.new(37.7430664,-122.4100434),
      Geokit::LatLng.new(37.743077,-122.4097243),
      Geokit::LatLng.new(37.7430537,-122.4093837),
      Geokit::LatLng.new(37.7432169,-122.40939440000001),
      Geokit::LatLng.new(37.7432318,-122.4090457),
      Geokit::LatLng.new(37.7431724,-122.4084126),
      Geokit::LatLng.new(37.7431258,-122.40803719999998),
      Geokit::LatLng.new(37.7430452,-122.40737200000001),
      Geokit::LatLng.new(37.7428596,-122.405457),
      Geokit::LatLng.new(37.7412211,-122.4066961),
      Geokit::LatLng.new(37.7404109,-122.40693750000001),
      Geokit::LatLng.new(37.7387352,-122.407136),
      Geokit::LatLng.new(37.7364783,-122.4067712),
      Geokit::LatLng.new(37.7359183,-122.4079085),
      Geokit::LatLng.new(37.7358589,-122.40850930000002),
      Geokit::LatLng.new(37.7357571,-122.4090672),
      Geokit::LatLng.new(37.7354219,-122.40978599999998),
      Geokit::LatLng.new(37.7348407,-122.4106121),
      Geokit::LatLng.new(37.7343274,-122.41163139999999),
      Geokit::LatLng.new(37.7338649,-122.4122214),
      Geokit::LatLng.new(37.7331013,-122.4137449),
      Geokit::LatLng.new(37.7333474,-122.41382000000002),
      Geokit::LatLng.new(37.7340347,-122.4137878),
      Geokit::LatLng.new(37.7347474,-122.413702),
      Geokit::LatLng.new(37.7348323,-122.4149037),
      Geokit::LatLng.new(37.7368134,-122.414732),
      Geokit::LatLng.new(37.738854,-122.41451740000001),
      Geokit::LatLng.new(37.7389579,-122.414614),
      Geokit::LatLng.new(37.7424725,-122.41426),
      Geokit::LatLng.new(37.7438087,-122.41327289999998)
      ])
    
    @@south_west_region = Geokit::Polygon.new([
      Geokit::LatLng.new(37.7330589,-122.41382000000002),
      Geokit::LatLng.new(37.7332699,-122.413928),
      Geokit::LatLng.new(37.7347113,-122.4137785),
      Geokit::LatLng.new(37.7347685,-122.41498140000002),
      Geokit::LatLng.new(37.7388709,-122.41461930000001),
      Geokit::LatLng.new(37.7390661,-122.41653439999999),
      Geokit::LatLng.new(37.7392697,-122.4186051),
      Geokit::LatLng.new(37.7401309,-122.42072939999998),
      Geokit::LatLng.new(37.7405445,-122.42181300000001),
      Geokit::LatLng.new(37.7409835,-122.42285380000001),
      Geokit::LatLng.new(37.7406527,-122.423079),
      Geokit::LatLng.new(37.7397957,-122.4236691),
      Geokit::LatLng.new(37.7398636,-122.42419490000002),
      Geokit::LatLng.new(37.7391255,-122.4244738),
      Geokit::LatLng.new(37.7383024,-122.42477420000002),
      Geokit::LatLng.new(37.7376576,-122.42532129999998),
      Geokit::LatLng.new(37.736385,-122.426759),
      Geokit::LatLng.new(37.7353244,-122.4283254),
      Geokit::LatLng.new(37.7347135,-122.42914080000001),
      Geokit::LatLng.new(37.7317946,-122.43484849999999),
      Geokit::LatLng.new(37.732375,-122.43186060000001),
      Geokit::LatLng.new(37.732453,-122.43034510000001),
      Geokit::LatLng.new(37.7322595,-122.42877600000001),
      Geokit::LatLng.new(37.731864,-122.4268824),
      Geokit::LatLng.new(37.7317057,-122.4258377),
      Geokit::LatLng.new(37.7316323,-122.42464280000002),
      Geokit::LatLng.new(37.7316249,-122.4231434),
      Geokit::LatLng.new(37.7320576,-122.4212203),
      Geokit::LatLng.new(37.7321885,-122.41984430000001),
      Geokit::LatLng.new(37.7321667,-122.4179641),
      Geokit::LatLng.new(37.7321601,-122.41720640000001),
      Geokit::LatLng.new(37.7322552,-122.41642720000002),
      Geokit::LatLng.new(37.7325807,-122.41510210000001),
      Geokit::LatLng.new(37.7330589,-122.41382000000002)
      ])
  
    def add_region
      # need refactoring
      pt = Geokit::LatLng.new(self.latitude,self.longitude)
      if self.latitude.nil? and self.longitude.nil?
        self.errors.add(:location, ": Invalid address - please try again")
      elsif @@north_region.contains?(pt)
        self.region = "North"
      elsif @@central_region.contains?(pt)
        self.region = "Central"
      elsif @@south_east_region.contains?(pt)
        self.region = "South-East"
      elsif @@south_west_region.contains?(pt)
        self.region = "South-West"
      else
        self.errors.add(:region, ": Invalid address - not in Bernal Heights Neighborhood.")
      end
    end
    
    def self.to_csv(hotspots)
      attributes = %w(id issue_types location details occurred_date occurred_time creator_name creator_email creator_number report_num to_share walk)
      CSV.generate do |csv|
        csv << attributes
        hotspots.each do |hotspot|
          csv << attributes.map{ |attr| hotspot.send(attr) }
        end
      end
    end
end
