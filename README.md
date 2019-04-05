![logo](logo/original-horizontal.png)

Dining Car
==========

Dining Car is **free, open-source** Ruby on Rails recipe management and social network that allows users to create, store and share their recipes. It is federation-enabled using the [ActivityPub](https://activitypub.rocks/) protocol used by softwares such [Mastodon](https://joinmastodon.org), [Pleroma](https://pleroma.social/) and [Plume](https://github.com/Plume-org/Plume).

Dining Car is heavily inspired by [OpenEats](https://github.com/open-eats/OpenEats), but its focus is slightly different.

These are Dining Car core-features:

- Creating, editing, viewing and sharing recipes
- Browsing and searching for recipes
- Following users across Dining Car instances
- ActivityPub allows Dining Car profiles to be followed from other ActivityPub enabled softwares, recipes can receive comments and be shared around the Fediverse.

*Dining Car is Alpha Software, it is not yet ready for production use.*

## Development

Before you get started, ensure you have the following minimum versions: [Ruby 2.5+](http://www.ruby-lang.org/en/downloads/), [PostgreSQL 9.6+](http://www.postgresql.org/download/), [Redis 2.6+](http://redis.io/download).

You need to install Yarn and Ruby. Yarn has installation instructions for several OSs here: https://yarnpkg.com/lang/en/docs/install/ and Ruby can be installed either using RVM (https://rvm.io/rvm/install) or rbenv (https://github.com/rbenv/rbenv#installation).

The command to install ruby project dependencies is:

```
bundle install
```

To install javascript dependencies using yarn:

```
yarn install --pure-lockfile
```

By default the development environment wants to connect to a `dining-car_development` database on localhost using your user/ident to login to Postgres. To setup this database, run:

```
bundle exec rails db:setup
```

This will also fill the database with base data for cuisines, courses and units.

You can them run Dining Car using:

```
bundle exec rails server
```

You can then access dev environment by accessing `http://localhost:3000` in your browser.

You can run tests with

```
rails tests
```

Set a COVERAGE environment variable with any value if you want to see the coverage report by simplecov.

You can check localization status with:

```
i18n-tasks health
```


And check code quality with:

```
rubocop
```

Testing federation can be tricky and you should avoiding use `ngrok` or similar tools to avoid inserting ethereal instances into other softwares databases. If you need to test federation, the best way is to setup a server with a proper domain name and keep that up to date with your fork of the project while developing on localhost.

## Built With

- [Ruby on Rails](https://github.com/rails/rails) &mdash; Our back end is a Rails app. It serves an API (still in development) but also a static website.
- [PostgreSQL](http://www.postgresql.org/) &mdash; Our main data store is in Postgres.
- [Redis](http://redis.io/) &mdash; We use Redis as a cache and for transient data.

Plus *lots* of Ruby Gems, a complete list of which is at [/master/Gemfile](https://github.com/dining-car/dining-car/blob/master/Gemfile).

## Contributing

Dining Car is **100% free** and **open source**. We encourage and support an active, healthy community that accepts contributions from the public &ndash; including you!

## License

Copyright (C) 2018 Renato Cerqueira & other Dining Car contributors

This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
