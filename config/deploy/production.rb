role :app, %w{deploy@getpointing.com}
role :web, %w{deploy@getpointing.com}
role :db,  %w{deploy@getpointing.com}

set :rvm_ruby_version, '2.2.2@getpointing-prod'

set :ssh_options, { forward_agent: true }
set :deploy_to, '/home/rails/prod'