# # Change these
# server '35.161.31.102', roles: [:web, :app, :db], primary: true

# set :repo_url,        'git@github.com:neerajkumar925/propertyggn.git'
# set :application,     'properyggn'
# set :user,            'ubuntu'
# set :puma_threads,    [4, 16]
# set :puma_workers,    0

# # Don't change these unless you know what you're doing
# set :pty,             true
# set :use_sudo,        false
# set :stage,           :production
# set :deploy_via,      :remote_cache
# set :deploy_to,       "/home/#{fetch(:user)}/usr/#{fetch(:application)}"
# # set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
# # set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
# # set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
# # set :puma_access_log, "#{release_path}/log/puma.error.log"
# # set :puma_error_log,  "#{release_path}/log/puma.access.log"
# set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
# set :puma_preload_app, true
# set :puma_worker_timeout, nil
# set :puma_init_active_record, true  # Change to false when not using ActiveRecord


role :app, %w{ubuntu@35.161.31.102}
role :web, %w{ubuntu@35.161.31.102}
role :db,  %w{ubuntu@35.161.31.102}


set :application,     'propertyggn'
set :repo_url,        'git@github.com:neerajkumar925/propertyggn.git'
set :deploy_to,       "/home/ubuntu/usr/#{fetch(:application)}"


set :scm, :git
set :branch, 'master'
set :keep_releases, 5

set :format, :pretty
set :log_level, :debug
set :pty, true

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :stage, :production


set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 16]
set :puma_workers, 0
set :puma_init_active_record, true
set :puma_preload_app, true
