# Gibson nginx

## Installation

Using [Berkshelf](http://berkshelf.com/), add the nginx cookbook to your Berksfile.

```ruby
    cookbook 'nginx', git: 'git@git.ldk.io:logankoester/gibson.git', rel: 'chef/cookbooks/nginx', branch: 'master'
```

Then run `berks` to install it.

## Default

Installs and starts nginx service.

### Usage

Add `recipe[nginx::default]` to your run list.

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
