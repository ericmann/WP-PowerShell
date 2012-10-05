WP-PowerShell
=============

Windows PowerShell wrapper for WordPress CLI tools.

Requirements
------------

* PHP >= 5.3
* WP >= 3.3

Installing
----------

Clone the repository into [User]/Documents/WindowsPowerShell/Modules.

Run `Import-Module WP-PowerShell` from the PowerShell prompt.

Using
-----

Navigate to a WordPress root folder within Windows:

```
cd C:\xampp\htdocs\wp
```

Enclose multiple CLI commands in quotes.  For example:

```
wp "home help"
```

Typing `wp help` should show you output similar to this:

```
Example usage:
	wp google-sitemap [build|help] ...
	wp core [update|help] ...
	wp home [help] ...
	wp option [add|update|delete|get|help] ...
	wp plugin [status|activate|deactivate|install|delete|update|help] ...
	wp theme [status|details|activate|help] ...
```

Changelog
---------------

**1.0**

- Initial release

Contributors
------------

- [Eric Mann](http://eamann.com)