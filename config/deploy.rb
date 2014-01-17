require "bundler/capistrano"

set :application,   "Social Smarts"
set :repository,    "https://github.com/wvmitchell/SocialSmarts"
set :scm,           :git
set :branch,        "master"
set :deploy_to,     "~/SocialSmarts/SocialSmarts"
set :user,          "root"

server "web",       :app, :web, :db, :primary => true