role :app, %w{deploy@192.241.220.95}
role :web, %w{deploy@192.241.220.95}
role :db,  %w{deploy@192.241.220.95}

set :rvm_ruby_version, '2.2.2@getpointing-prod'

set :ssh_options, { forward_agent: true }
set :deploy_to, '/home/rails/prod'
set :branch, 'feature/deployment'