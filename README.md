# nginx cookbook
> A simple nginx configuration.

[![Build Status](http://ci.ldk.io/logankoester/chef-nginx/badge)](http://ci.ldk.io/logankoester/chef-nginx/)
[![Gittip](http://img.shields.io/gittip/logankoester.png)](https://www.gittip.com/logankoester/)

## Installation

Using [Berkshelf](http://berkshelf.com/), add the nginx cookbook to your Berksfile.

```ruby
cookbook 'nginx', github: 'logankoester/chef-nginx', branch: 'master'
```

Then run `berks` to install it.

## default recipe

Installs and starts nginx service.

### Usage

Add `recipe[nginx::default]` to your run list.

## php_fpm recipe

Installs php and php-fpm for nginx.

### Usage

Add `recipe[nginx::php_fpm]` to your run list.

## Attributes

Refer to `attributes/default.rb` for details.

## Development

You should have Ruby and Rubygems already installed.

    # Clone the repository
    $ git clone git@github.com:logankoester/chef-nginx.git
    $ cd chef-nginx

    # Install Ruby gem dependencies
    $ bundle install

    # Install with Berkshelf
    $ berks install

    # Start the Guard watcher
    $ bundle exec guard start

    # Edit files...
    # Spec and Foodcritic will verify your changes when a file is modified

## Author

Copyright (c) 2014-2016 [Logan Koester](http://logankoester.com). Released under the MIT license. See `LICENSE` for details.
