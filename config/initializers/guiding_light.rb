GuidingLight.configure do |config|
  config.api_key    = Rails.configuration.guiding_light[:api_key]
  config.site_id    = Rails.configuration.guiding_light[:site_id]
  config.solr_url   = Rails.configuration.guiding_light[:solr_url]
end
