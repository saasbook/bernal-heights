namespace :cleanup do
  desc "removes stale and inactive hotspots from the database"
  task :hotspots => :environment do
    
    incomplete_hotspots = Hotspot.where("status is not 'active'")

    # delete them
    incomplete_hotspots.map(&:destroy)
  end
end