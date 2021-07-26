namespace :clean do
  desc 'Clean dictionary on redis'
  task dictionary: :environment do
    REDIS.flushall
  end
end