desc "Update event feeds"
task :update_events => :environment do
  Events::BulkFetcher.fetch_and_save_all!
  puts "Updated events"
end
