namespace :clean do
  desc 'Clean dictionary on redis'
  task dictionary: :environment do
    Redis.new.flushall
  end
end