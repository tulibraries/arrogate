set :output, "/var/www/arrogate/log/cron_log.log"
#
every :monday, :at => '1am' do
  command "cd /var/www/arrogate; bundle exec lg2solr harvest_all"
end
