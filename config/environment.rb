# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

require "blacklight_helper_behavior_patch"
