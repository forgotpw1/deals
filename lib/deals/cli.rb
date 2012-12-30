require 'thor'

module Deals
  class CLI < Thor
    include Thor::Actions

    desc "install", "install and configure deals"
    def install
      if already_installed?
        update
      else        
        inject_devise
        inject_rails_admin
        inject_carrierwave
        run('bundle install')
        run('rake deals:install:migrations')
        run('rake db:migrate')   
        run('rails generate devise:install')
        run('rails generate devise User') 
        run('rake db:migrate')      
        run('rails g rails_admin:install')
        run('rake db:migrate')      
        mount_deals_route
        welcome
      end
    end
    
    desc "update", "update deals"
    def update
      say "Deals install detected"
      say "Updating current Deals install"
      run('rake deals:install:migrations')
      say_upgraded
    end

    desc "inject_devise", "add devise"
    def inject_devise
      puts 'add reference to devise in GEMFILE'
      insert_into_file "Gemfile", "gem 'devise'\n", :after => "source 'https://rubygems.org'\n"
    end

    
    desc "inject_rails_admin", "add rails_admin"
    def inject_rails_admin
      puts 'add reference to rails_admin in GEMFILE'
      insert_into_file "Gemfile", "gem 'rails_admin'\n", :after => "gem 'devise'\n"
    end

    desc "inject_carrierwave", "add carrierwave"
    def inject_carrierwave
      puts 'add reference to carrierwave in GEMFILE'
      insert_into_file "Gemfile", "gem 'carrierwave'\n", :after => "gem 'rails_admin'\n"
      create_file "config/initializers/carrierwave.rb", "require 'carrierwave/orm/activerecord'"
    end
  
    desc "mount_deals_route", "mount deals route"
    def mount_deals_route
      insert_into_file "config/routes.rb", "\n  mount Deals::Engine => '/deals', :as => 'deals'\n", :after => "Application.routes.draw do\n"
    end
  
    desc "create user class", "Create a user class"
    def create_user_class
      run('rails generate model User')      
    end
    
    desc "welcome", "invite to deals"
    def welcome
      say ""
      say ""
      say ""
      say "******************************************************************"
      say "******************************************************************"
      say "Deals Successfully Installed!"
      say "******************************************************************"
    end
    
    desc "say_upgraded", "deals upgraded"
    def say_upgraded
      say ""
      say ""
      say ""
      say "******************************************************************"
      say "******************************************************************"
      say "Deals Successfully Upgraded!"
      say "******************************************************************"
    end
    
    private
    
    def already_installed?
      open('config/routes.rb') { |f| f.grep(/Deals\:\:Engine/) }.any?
    end
    
    
  end
end
