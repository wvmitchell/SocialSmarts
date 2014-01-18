# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'my_app_name'
set :repo_url, 'git@example.com:me/my_repo.git'

require "bundler/capistrano"

set :application,   "Social Smarts"
set :repository,    "https://github.com/wvmitchell/SocialSmarts"
set :scm,           :git
set :branch,        "master"
set :deploy_to,     "~/SocialSmarts/SocialSmarts"
set :user,          "root"

server "web",       :app, :web, :db, :primary => true

###

namespace :deploy do

  desc "monit VPS remote communication"  task :monit_symlink, :roles => :web do
    run "#{sudo} ln -nfs #{release_path}/config/monit.conf /etc/monit/conf.d/example.conf"  
  end

  desc "reloads monit config"  task :monit_reload do
    run "#{sudo} monit reload"  
  end

  desc "applies the nginx config symlink"
  task :nginx_symlink, :roles => :web do
    run "#{sudo} ln -nfs #{release_path}/config/nginx.conf /etc/nginx/sites-enabled/example"
  end

  desc "reloads nginx config"
  task :nginx_reload, :roles => :web do
    run "#{sudo} /etc/init.d/nginx reload"
  end

  desc "start the app"
  task :start, :roles => :web do
    run "#{sudo} monit start example"
  end

  desc "stop the app"
  task :stop, :roles => :web do
    run "#{sudo} monit stop example"
  end

  desc "restart the app"
  task :restart, :roles => :web do
    if update_db?
      run "#{sudo} monit stop example"
      run "cd #{current_release} && bundle exec rake db:migrate"
      run "cd #{current_release} && bundle exec rake db:seed"
      run "#{sudo} monit start example"
    else
      run "#{sudo} monit restart example"
    end
  end

end


# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
