# CountrySelect
module ActionView
  module Helpers
    module FormOptionsHelper
      # Return select and option tags for the given object and method, using country_options_for_select to generate the list of option tags.
      def country_select(object, method, priority_countries = nil, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_country_select_tag(priority_countries, options, html_options)
      end
      # Returns a string of option tags for pretty much any country in the world. Supply a country name as +selected+ to
      # have it marked as the selected option tag. You can also supply an array of countries as +priority_countries+, so
      # that they will be listed above the rest of the (long) list.
      #
      # NOTE: Only the option tags are returned, you have to wrap this call in a regular HTML select tag.
      def country_options_for_select(selected = nil, priority_countries = nil, country_code='FULL')
        country_options = ""

        if priority_countries
          country_options += options_for_select(priority_countries, selected)
          country_options += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
        end

        return country_options + options_for_select( (country_code.to_i == 2) ? COUNTRIES_TWO_CODE : COUNTRIES, selected)
      end
      # All the countries included in the country_options output.
      COUNTRIES = ["Afghanistan", "Aland Islands", "Albania", "Algeria", "American Samoa", "Andorra", "Angola",
        "Anguilla", "Antarctica", "Antigua And Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria",
        "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin",
        "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil",
        "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia",
        "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China",
        "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo",
        "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia", "Cuba",
        "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt",
        "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)",
        "Faroe Islands", "Fiji", "Finland", "France", "French Guiana", "French Polynesia",
        "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea",
        "Guinea-Bissau", "Guyana", "Haiti", "Heard and McDonald Islands", "Holy See (Vatican City State)",
        "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran, Islamic Republic of", "Iraq",
        "Ireland", "Isle of Man", "Israel", "Italy", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya",
        "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan",
        "Lao People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya",
        "Liechtenstein", "Lithuania", "Luxembourg", "Macao", "Macedonia, The Former Yugoslav Republic Of",
        "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique",
        "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of",
        "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru",
        "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger",
        "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau",
        "Palestinian Territory, Occupied", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines",
        "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation",
        "Rwanda", "Saint Barthelemy", "Saint Helena", "Saint Kitts and Nevis", "Saint Lucia",
        "Saint Pierre and Miquelon", "Saint Vincent and the Grenadines", "Samoa", "San Marino",
        "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore",
        "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa",
        "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "Sudan", "Suriname",
        "Svalbard and Jan Mayen", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic",
        "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Timor-Leste",
        "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan",
        "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom",
        "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela",
        "Viet Nam", "Virgin Islands, British", "Virgin Islands, U.S.", "Wallis and Futuna", "Western Sahara",
        "Yemen", "Zambia", "Zimbabwe"] unless const_defined?("COUNTRIES")

        COUNTRIES_TWO_CODE = [
          ['Afghanistan', 'AF'], ['Albania', 'AL'], ['Algeria', 'DZ'], ['American Samoa', 'AS'], ['Andorra', 'AD'],
          ['Angola', 'AO'], ['Anguilla', 'AI'], ['Antarctica', 'AQ'], ['Antigua and Barbuda', 'AG'], ['Argentina', 'AR'],
          ['Armenia', 'AM'], ['Aruba', 'AW'], ['Australia', 'AU'], ['Austria', 'AT'], ['Azerbaidjan', 'AZ'],
          ['Bahamas', 'BS'], ['Bahrain', 'BH'], ['Bangladesh', 'BD'], ['Barbados', 'BB'], ['Belarus', 'BY'],
          ['Belgium', 'BE'], ['Belize', 'BZ'], ['Benin', 'BJ'], ['Bermuda', 'BM'], ['Bhutan', 'BT'],
          ['Bolivia', 'BO'], ['Bosnia-Herzegovina', 'BA'], ['Botswana', 'BW'], ['Bouvet Island', 'BV'],
          ['Brazil', 'BR'], ['British Indian Ocean Territory', 'IO'], ['Brunei Darussalam', 'BN'], ['Bulgaria', 'BG'],
          ['Burkina Faso', 'BF'], ['Burundi', 'BI'], ['Cambodia', 'KH'], ['Cameroon', 'CM'], ['Canada','CA'], ['Cape Verde', 'CV'],
          ['Cayman Islands', 'KY'], ['Central African Republic', 'CF'], ['Chad', 'TD'], ['Chile', 'CL'],
          ['China', 'CN'], ['Christmas Island', 'CX'], ['Cocos (Keeling) Islands', 'CC'], ['Colombia', 'CO'],
          ['Comoros', 'KM'], ['Congo', 'CG'], ['Cook Islands', 'CK'], ['Costa Rica', 'CR'], ['Croatia', 'HR'],
          ['Cuba', 'CU'], ['Cyprus', 'CY'], ['Czech Republic', 'CZ'], ['Denmark', 'DK'], ['Djibouti', 'DJ'],
          ['Dominica', 'DM'], ['Dominican Republic', 'DO'], ['East Timor', 'TP'], ['Ecuador', 'EC'],
          ['Egypt', 'EG'], ['El Salvador', 'SV'], ['Equatorial Guinea', 'GQ'], ['Eritrea', 'ER'],
          ['Estonia', 'EE'], ['Ethiopia', 'ET'], ['Falkland Islands', 'FK'], ['Faroe Islands', 'FO'],
          ['Fiji', 'FJ'], ['Finland', 'FI'], ['Former Czechoslovakia', 'CS'], ['Former USSR', 'SU'],
          ['France', 'FR'], ['France (European Territory)', 'FX'], ['French Guyana', 'GF'],
          ['French Southern Territories', 'TF'], ['Gabon', 'GA'], ['Gambia', 'GM'], ['Georgia', 'GE'],
          ['Germany', 'DE'], ['Ghana', 'GH'], ['Gibraltar', 'GI'], ['Great Britain', 'GB'],
          ['Greece', 'GR'], ['Greenland', 'GL'], ['Grenada', 'GD'], ['Guadeloupe (French)', 'GP'],
          ['Guam (USA)', 'GU'], ['Guatemala', 'GT'], ['Guinea', 'GN'],['Guinea Bissau', 'GW'],
          ['Guyana', 'GY'],['Haiti', 'HT'],['Heard and McDonald Islands', 'HM'],['Honduras', 'HN'],
          ['Hong Kong', 'HK'],['Hungary', 'HU'],['Iceland', 'IS'],['India', 'IN'],
          ['Indonesia', 'ID'],['International', 'INT'],['Iran', 'IR'],['Iraq', 'IQ'],
          ['Ireland', 'IE'],['Israel', 'IL'],['Italy', 'IT'],['Ivory Coast (Cote D&#39;Ivoire)', 'CI'],
          ['Jamaica', 'JM'],['Japan', 'JP'],['Jordan', 'JO'],['Kazakhstan', 'KZ'],
          ['Kenya', 'KE'],['Kiribati', 'KI'],['Kuwait', 'KW'],['Kyrgyzstan', 'KG'],
          ['Laos', 'LA'],['Latvia', 'LV'],['Lebanon', 'LB'],['Lesotho', 'LS'],
          ['Liberia', 'LR'],['Libya', 'LY'],['Liechtenstein', 'LI'],['Lithuania', 'LT'],
          ['Luxembourg', 'LU'],['Macau', 'MO'],['Macedonia', 'MK'],['Madagascar', 'MG'],
          ['Malawi', 'MW'],['Malaysia', 'MY'],['Maldives', 'MV'],['Mali', 'ML'],['Malta', 'MT'],
          ['Marshall Islands', 'MH'],['Martinique (French)', 'MQ'],['Mauritania', 'MR'],
          ['Mauritius', 'MU'],['Mayotte', 'YT'],['Mexico', 'MX'],['Micronesia', 'FM'],
          ['Moldavia', 'MD'],['Monaco', 'MC'],['Mongolia', 'MN'],['Montserrat', 'MS'],
          ['Morocco', 'MA'],['Mozambique', 'MZ'],['Myanmar', 'MM'],['Namibia', 'NA'],
          ['Nauru', 'NR'],['Nepal', 'NP'],['Netherlands', 'NL'],['Netherlands Antilles', 'AN'],
          ['Neutral Zone', 'NT'],['New Caledonia (French)', 'NC'],['New Zealand', 'NZ'],
          ['Nicaragua', 'NI'],['Niger', 'NE'],['Nigeria', 'NG'],['Niue', 'NU'],
          ['Norfolk Island', 'NF'],['North Korea', 'KP'],['Northern Mariana Islands', 'MP'],
          ['Norway', 'NO'],['Oman', 'OM'],['Pakistan', 'PK'],['Palau', 'PW'],['Panama', 'PA'],
          ['Papua New Guinea', 'PG'],['Paraguay', 'PY'],['Peru', 'PE'],['Philippines', 'PH'],
          ['Pitcairn Island', 'PN'],['Poland', 'PL'],['Polynesia (French)', 'PF'],['Portugal', 'PT'],
          ['Puerto Rico', 'PR'],['Qatar', 'QA'],['Reunion (French)', 'RE'],['Romania', 'RO'],
          ['Russian Federation', 'RU'],['Rwanda', 'RW'],['S. Georgia & S. Sandwich Isls.', 'GS'],
          ['Saint Helena', 'SH'],['Saint Kitts & Nevis Anguilla', 'KN'],['Saint Lucia', 'LC'],
          ['Saint Pierre and Miquelon', 'PM'],['Saint Tome (Sao Tome) and Principe', 'ST'],
          ['Saint Vincent & Grenadines', 'VC'],['Samoa', 'WS'],['San Marino', 'SM'],['Saudi Arabia', 'SA'],
          ['Senegal', 'SN'],['Seychelles', 'SC'],['Sierra Leone', 'SL'],['Singapore', 'SG'],
          ['Slovak Republic', 'SK'],['Slovenia', 'SI'],['Solomon Islands', 'SB'],['Somalia', 'SO'],
          ['South Africa', 'ZA'],['South Korea', 'KR'],['Spain', 'ES'],['Sri Lanka', 'LK'],
          ['Sudan', 'SD'],['Suriname', 'SR'],['Svalbard and Jan Mayen Islands', 'SJ'],
          ['Swaziland', 'SZ'],['Sweden', 'SE'],['Switzerland', 'CH'],['Syria', 'SY'],['Tadjikistan', 'TJ'],
          ['Taiwan', 'TW'],['Tanzania', 'TZ'],['Thailand', 'TH'],['Togo', 'TG'],['Tokelau', 'TK'],
          ['Tonga', 'TO'],['Trinidad and Tobago', 'TT'],['Tunisia', 'TN'],['Turkey', 'TR'],
          ['Turkmenistan', 'TM'],['Turks and Caicos Islands', 'TC'],['Tuvalu', 'TV'],['Uganda', 'UG'],
          ['Ukraine', 'UA'],['United Arab Emirates', 'AE'],['United Kingdom', 'GB'],['United States','US'],
          ['Uruguay', 'UY'],['USA Military', 'MIL'],['USA Minor Outlying Islands', 'UM'],
          ['Uzbekistan', 'UZ'],['Vanuatu', 'VU'],['Vatican City State', 'VA'],
          ['Venezuela', 'VE'],['Vietnam', 'VN'],['Virgin Islands (British)', 'VG'],
          ['Virgin Islands (USA)', 'VI'],['Wallis and Futuna Islands', 'WF'],
          ['Western Sahara', 'EH'],['Yemen', 'YE'],['Yugoslavia', 'YU'],['Zaire', 'ZR'],
          ['Zambia', 'ZM'],['Zimbabwe', 'ZW']
        ] unless const_defined?("COUNTRIES_TWO_CODE")

    end

    class InstanceTag
      def to_country_select_tag(priority_countries, options, html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = value(object)
        content_tag("select",
          add_options(
            country_options_for_select(value, priority_countries,
              options[:country_code].presence || 'FULL'
            ),
            options, value
          ), html_options
        )
      end
    end

    class FormBuilder
      def country_select(method, priority_countries = nil, options = {}, html_options = {})
        @template.country_select(@object_name, method, priority_countries, options.merge(:object => @object), html_options)
      end
    end
  end
end