# Use this file to easily define all of your cron jobs.
# Learn more: http://github.com/javan/whenever

every 1.day, at: '3:00' do
  command "bin/clean_cache.sh"
end
