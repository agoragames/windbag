# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require 'rspec/rails'
require 'shoulda/matchers/integrations/rspec'
require 'database_cleaner'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = true

  require 'factory_girl'
  config.include FactoryGirl::Syntax::Methods
  FactoryGirl.find_definitions

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    Snoop::Notification.skip_callback :create, :after, :deliver
  end

  config.after(:all) do
    # Clean up data creted in the before(:all) blocks
    DatabaseCleaner.clean_with :truncation
  end
end
