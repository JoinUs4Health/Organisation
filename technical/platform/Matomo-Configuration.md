# Matomo - User Tracking
"Google Analytics alternative that protects your data and your customers' privacy"

Matomo runs locally and does not collect unnecessary date nor transmits it to third parties.
Therefor it is compatible with the GDPR and can be used in the EU.

## Links
- [Matomo Website](https://matomo.org/)
- [general Installation](https://matomo.org/docs/installation/)
- [On-Premise-Installation Overview](https://matomo.org/guide/installation-maintenance/matomo-on-premise-self-hosted/)

## Installtion in Ju4H-Project
### Matomo Server Installation
Our Matomo Server runs on a root server.
The server installation, security and safety configuration is not part of this documentation.

Basically our Matomo runs on a stable Debian system in an Apache environment with a MariaDB.

### Matomo Client Installation (the Platform)
To connect the Ju4H-Platform to Matomo, the WordPress-Plugin `WP-Matomo` ([Matomo documentation](https://matomo.org/faq/new-to-piwik/how-do-i-install-the-matomo-tracking-code-on-wordpress/)).
To establish the connection, a Security Token, created on the Server must be placed in the Clients configuration.

## Configuration
Configuration is mostly necessary to comply with the law (i.e. GDPR, CCPA, PECR, ePrivacy), minimise possible legal issues and avoid unwanted content such as cookie banners ([Matomo documentation](https://matomo.org/faq/new-to-piwik/how-do-i-use-matomo-analytics-without-consent-or-cookie-banner/#how-to-configure-matomo-for-consentless-privacy)).

### Matomo Server Configuration
#### Server-Installation/Configuration
Our Matomo Server runs on a root server.
The server installation, security and safety configuration is not part of this documentation.

Basically our Matomo runs on a stable Debian system in an Apache environment with a MariaDB.

Matomo provides GDPR-Tools to process subject rights in terms of GDPR-requests.
Find it on the Matomo Server under `Administration` → `Privacy` → `GDPR Tools`.

#### Matomo-Configuration on the Matomo Server
- `Administration`
    - `System`
        - `General settings`
            - `Email server settings`
                - enter SMTP configuration to get e-mails by Matomo
            - `Update settings`
                - `Release channel` - *latest stable release*
            - [Live](https://matomo.org/faq/how-to/how-do-i-disable-the-visits-log-or-the-visitor-profile-feature/)
                - `Turn off visits log and the visitor profile` - *Yes*
            - [PrivacyManager](https://matomo.org/faq/general/configure-privacy-settings-in-matomo/#step-10-optional-privacy-preferences)
                - add Platform-Links to privacy statement, terms of use and legal notice
        - `Geolocation`
            - [Location provider](https://matomo.org/faq/how-to/setting-up-accurate-visitors-geolocation/) - DBIP/GeoIP 2 (PHP)
                - Important: use a local provider running on the server
    - `Privacy`
        - `Anonimyze data`
            - `Anonymize Tracking Data`
                - [Anonymize Tracking Data](https://matomo.org/faq/general/configure-privacy-settings-in-matomo/#step-1-automatically-anonymise-visitor-ips-and-replace-user-ids)
                    - `Select how many bytes of the visitors' IPs should be masked.` - *at least* 2 bytes to be anonymised (i.e. `192.168.xxx.xxx`)
                    - `Also use the Anonymized IP addresses when enriching visits.` - *Yes*
                        - Important: If the full IP-Address is used for Geolocation, do not store it on our server. Do not change the Geolocation-Provider to an external one!
                    - `Replace User ID with a pseudonym` - *Yes*
                    - `Anonymize Order ID` - *Yes*
                    - `Force tracking without cookies` - *Yes*
                    - `Anonymize Referrer` - *Remove query parameters from referrer URL*
                - [Regularly delete old raw visitor data](https://matomo.org/faq/general/configure-privacy-settings-in-matomo/#step-2-regularly-delete-old-raw-visitor-data)
                    - `Regularly delete old raw data from the database` - *Yes*
                    - `Delete logs older then (days)` - *30*
                - [Delete old aggregated report data](https://matomo.org/faq/troubleshooting/faq_42/#delete-old-reports-data)
                    - `Regularly delete old reports from the database` - *Yes*
                    - `Delete reports older than (months)` - *12*
                    - `Keep basic metrics` - *Yes*
                    - `Keep all data for` - Monthly reports, Yearly reports
                - `Schedule old data deletion`
                    - `Delete old data every` - *day*
        - `Users opt-out`
            - `Support Do Not Track preference`
                - `Enable Do Not Track support` - *Yes*

### Matomo Client Configuration
- `Settings` → `Connect Matomo`
    - Tab `Enable Tracking`
        - [Disable Cookies](https://matomo.org/faq/general/faq_157/) by *enabling* `Disable cookies`
            - check: `_paq.push(["disableCookies"]);` will be added to Tracking code
- [Add information about the Matomo usage to the privacy statement](https://matomo.org/faq/general/configure-privacy-settings-in-matomo/#step-5-create-a-privacy-policy-page-on-your-websites)
- [Add Opt-Out-Option to the privacy statement](https://matomo.org/faq/general/configure-privacy-settings-in-matomo/#step-3-include-a-web-analytics-opt-out-feature-on-your-site)
    - get the HTML code on the Matomo Server under `Administration` → `Privacy` → `Users opt-out` → `Let users opt-out of tracking`

