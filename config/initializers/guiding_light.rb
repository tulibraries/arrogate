GuidingLight.configure do |config|
  config.api_key =  Rails.configuration.guiding_light.fetch(:api_key, "")
  config.solr_url = Rails.configuration.guiding_light.fetch(:solr_url, "")
end
