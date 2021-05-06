require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# In order to send PATCH or DELETE requests, I will need to add a line of code here...
use Rack::MethodOverride

# Here is where I will mount other controllers with 'use'
use UsersController
use SpoilersController
run ApplicationController