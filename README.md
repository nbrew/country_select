CountrySelect
=============

Provides a simple helper to get an HTML select list of countries.  The list of countries comes from the ISO 3166 standard.  While it is a relatively neutral source of country names, it will still offend some users.

Users are strongly advised to evaluate the suitability of this list given their user base.

* Added Country 2 Code abbreviations to select menu.

Example
=======

# Standard, full country names
country_select("user", "country_name")

# Two-character abbreviations as the select values
country_select("user", "country_abbreviation", [['United States','US']], {:country_code => 2})

Copyright (c) 2008 Michael Koziarski, released under the MIT license
