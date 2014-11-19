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

    # Start an archlinux vm
    cd nginx
    vagrant up 

    # Edit files...

    # Run again
    vagrant provision 

    # Verify
    vagrant ssh

## Author

Author:: Logan Koester (<logan@logankoester.com>)
