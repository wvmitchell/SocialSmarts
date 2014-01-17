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
