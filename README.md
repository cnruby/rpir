# Rpir

WiringRuby's extension for special components

## Installation

Add this line to your application's Gemfile:

    gem 'rpir'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rpir

## Usage
	
Use the circuit http://wiki.tolooh.com/raspberrypi/files/A822.1420.schaltplan.png

	$ touch config.yml
	$ vim config.yml # see the file features/support/config.yml
	$ touch a822-1420.rb
	$ vim a822-1420.rb # see example code https://gist.github.com/3686354
	$ sudo ruby a822-1420.rb