# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
SampleApp::Application.initialize!

# For sessions
config.action_dispatch.session = {
  :key    => '_app_session',
  :secret => '0x0dkfj3927dkc7djdh36rkckdfzsg'
}
