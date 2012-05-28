set :application, "project1"
# set :repository,  "set your repository location here"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "localhost:2222"                          # Your HTTP server, Apache/etc
set :user, "centos"
set :scm_passphrase, "reverse"
set :use_sudo, false
set :app_dir, "/home/#{user}/projects/rails/#{application}/"
set :deploy_to, "#{app_dir}/deploy"
set :branch, "master"

# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# set :rvm_ruby_string, ENV['GEM_HOME'].gsub(/.*\//,"") # for user install
set :rvm_type, :system # for root install
require "rvm/capistrano"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end