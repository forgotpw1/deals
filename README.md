Deals Gem (Engine)
========

Modular / mountable Deals API. Features:

* RESTful webservice for accessing deals

* Fully defined backend RailsAdmin interface for adding deals on the backend


Announcements
========

* Review the installation process below.
 

Installation
========

* First create a new rails project:
        rails new sweet_app

* Config your database.yml and create the databases
		
* Add to Gemfile:
    
        gem "deals"
 
* Next, run bundle install:

        bundle install

* Next, run the deals install command:

        deals install

(NOTE: If you run into an error saying that deals gem is missing, use bundle exec deals install)

* Deals is now installed and ready 

* Deals API is located at /deals

* To view API end points run: rake routes

More Details
========

Visit the project website [here][project-website].

[project-website]: http://deals.barrettgriffith.com/

TODO
========

* Add multiple photos for each deal

Copyright
========

Copyright (c) 2012 Barrett Griffith. See LICENSE.txt for further details.
