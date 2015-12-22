# README

## E-vader App

**E-vader App** is an accounting records management application. It is developed to fit **E-vader** needs.

## Usage

### Prerequisites

* Ruby 2.2.3
* Bundler
* JavaScript Runtime (e.g. Node.js)
* SQLite3
* Git

Installation speps for all of these can be found in [this guide](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-14-04)

### Installation

1. Clone this repository:

	```console
	git clone https://github.com/cristian-s/unlp_ttps-ruby_e-vader.git
	```
2. `cd` into project:

	```console
	cd unlp_ttps-ruby_e-vader
	```
3. Install dependencies:

	```console
	bundle install
	```
4. Setup database (this includes creating it, loading the schema and seeding it):

	```console
	bundle exec rake db:setup
	```
5. Run server:

	```console
	bundle exec rails server
	```

Now the server is running and listening on `http://localhost:3000`.
