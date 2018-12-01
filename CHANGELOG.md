CHANGELOG
=========

### v0.4.4
- Support load_module directive

### v0.4.3
- Sets fastcgi_buffer_size to better accomodate WordPress

### v0.4.2
- php_fpm recipe now installs the `php-gd` package.
- Removes extension directives from php.ini for dropped/built-in extensions in PHP 7.0

### v0.4.1
- Adjusts `php-fpm` value `pm.max_children` from 5 to 24

### v0.4.0
- Adds optional include_paths for additional nginx config

### v0.3.0
- Adds user recipe

### v0.2.0
- Optional supervisor support

### v0.1.0
- Initial release
