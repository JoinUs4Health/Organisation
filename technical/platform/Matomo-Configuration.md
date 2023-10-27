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

#### Matomo-Configuration on the Matomo Server
- `Administration` → `Privacy` → `Anonimyze data`
    - `Anonymize Tracking Data`
        - [Anonymise IP Address](https://matomo.org/faq/general/configure-privacy-settings-in-matomo/#step-1-automatically-anonymise-visitor-ips-and-replace-user-ids) by setting *at least* 2 bytes to be anonymised (i.e. `192.168.xxx.xxx`)



### Matomo Client Configuration
- Configure in `Settings` → `Connect Matomo`
    - Tab `Enable Tracking`
        - [Disable Cookies](https://matomo.org/faq/general/faq_157/) by *enabling* `Disable cookies`
            - check: `_paq.push(["disableCookies"]);` will be added to Tracking code


