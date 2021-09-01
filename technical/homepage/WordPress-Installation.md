# WordPress-Installation for the Project JoinUs4Health

<!-- TOC START min:1 max:4 link:true asterisk:false update:true -->
- [WordPress-Installation for the Project JoinUs4Health](#wordpress-installation-for-the-project-joinus4health)
    - [Overview](#overview)
    - [WordPress-Configuration](#wordpress-configuration)
        - [Plugins](#plugins)
        - [Disable Avatars](#disable-avatars)
        - [Privacy Statement](#privacy-statement)
    - [WordPress-Plugins used](#wordpress-plugins-used)
        - [WordPress-Plugin-Configuration](#wordpress-plugin-configuration)
            - [Configuration Elementor and Elementor Pro](#configuration-elementor-and-elementor-pro)
            - [Configuration Email Subscribers & Newsletters](#configuration-email-subscribers--newsletters)
            - [Configuration Polylang](#configuration-polylang)
            - [Configuration WP Event Manager](#configuration-wp-event-manager)
- [Attachments](#attachments)
    - [Attachment: WordPress-Plugins-Checks](#attachment-wordpress-plugins-checks)
        - [Contact Form 7](#contact-form-7)
        - [Elementor-Plugins](#elementor-plugins)
            - [Elementor](#elementor)
            - [Elementor Pro](#elementor-pro)
            - [Elementor Addon Elements](#elementor-addon-elements)
        - [Email Subscribers & Newsletters](#email-subscribers--newsletters)
        - [GDPR Cookie Consent](#gdpr-cookie-consent)
        - [Matomo Analytics Ethical Stats](#matomo-analytics-ethical-stats)
        - [Newsletter](#newsletter)
        - [One Click Accessibility](#one-click-accessibility)
        - [Polylang](#polylang)
        - [WP Event Manager](#wp-event-manager)
<!-- TOC END -->

**Changelog**

| date       | editor  | changes                                                             |
| ---------- | ------- | ------------------------------------------------------------------- |
| 01.09.2021 | winterb | updated WordPress-Configuration Details                             |
| 01.06.2021 | winterb | added Plugin-Check `Matomo`; added `WordPress-Plugin-Configuration` |
| 26.05.2021 | winterb | added Plugin-Check `Email Subscribers & Newsletters`                |
| 06.05.2021 | winterb | added `Changelog`, small structure changes                          |
| 04.05.2021 | winterb | added Plugin-Check `Newsletter`                                     |
| 03.05.2021 | winterb | added general chapter `WordPress-Configuration`                     |
| 06.04.2021 | winterb | created document with various Plugin-Check-results                  |

## Overview
This document gives information about all configurations and installations in the WordPress-Instance.
For the Server-Configuration, please see the `Server-Installation`.

## WordPress-Configuration
### Plugins
- enable all auto-updates for all plugins

### Disable Avatars
By using Gravatar-Service, personal data (IP, e-mail) is sent to the US company.

To disable the use of Avatars disable `Show Avatars` in `Settings → Discussion`.

### Privacy Statement
Link the Page with the privacy statement in `Show Avatars` in `Settings → Privacy`.

## WordPress-Plugins used
This is a list of checked and approved plugins used within out website:

- Elementor-Plugins
    - Elementor
    - Elementor Pro
- Email Subscribers & Newsletters
- One Click Accessibility

### WordPress-Plugin-Configuration
#### Configuration Elementor and Elementor Pro
- Disabled data sharing:
    1. `Dashboard → Elementor → Settings → General`
    1. uncheck "Usage Data Sharing"
- no usage of third-party-services:
    - `Dashboard → Elementor → Settings → Integrations`
- disable usage of local and session storage by providing custom script:
    1. `Dashboard → Elementor → Custom Code`
    1. added script `Disable Local Storage` ([reference](https://github.com/elementor/elementor/issues/7151))
        ```html
        <script>
          (function() {
            function init($) {
              jQuery( window ).on( 'elementor/frontend/init', function() {
                // Wait for elementor to be initialized. 
                // Then override elementorFrontend.storage.get and elementorFrontend.storage.set with empty functions,
                // to block Elementor from writing or reading anything there.
                if (elementorFrontend && !elementorFrontend.isEditMode() && !elementorFrontend.isWPPreviewMode()) {
                  elementorFrontend.storage.get = function() {}
                  elementorFrontend.storage.set = function() {}
                  
                  if (window.sessionStorage) {
                    window.sessionStorage.removeItem('elementor');
                  }
                  
                  if (window.localStorage) {
                    window.localStorage.removeItem('elementor');
                  }
                }
              });
            }
            
            var waitForJQuery = setInterval(function () {
              if (typeof jQuery != 'undefined') {
                init(jQuery);
                clearInterval(waitForJQuery);
              }
            }, 10);
          })();
        </script>
        ```

#### Configuration Email Subscribers & Newsletters
- TODO with double-opt-in
- TODO without any third-party service

#### Configuration Polylang
- TODO no auto-translate used

#### Configuration WP Event Manager
- TODO not synced to any third-party-service

---

# Attachments

## Attachment: WordPress-Plugins-Checks
This Section has the results of our plugin-checks, we do in terms of privacy and security.

General Information about Privacy Policy for WordPress plugins:

- https://www.termsfeed.com/blog/privacy-policy-wordpress-plugins/ (21.12.2020)
    - WordPress does not require a privacy policy from plugin developers
    - Developers **should remind** users, if they legally require to have a Privacy Policy
    - there is no default link on the plugins page, **if** they have some kind of privacy policy
    - all information, what data is processed, can only be read somewhere in the documents of the plugins - if the developer made a good documentation
- https://developer.wordpress.org/plugins/privacy/
    - WordPress privacy guidelines

### Contact Form 7
- description
    - add a simple way to create forms to get data from the user
- check
    - last checked: `24.03.2021, winterb`
    - version: `5.4`
    - privacy checked: ✓ ok
        - their thoughts about GDPR and how to create a GDPR-compliant form: https://contactform7.com/2018/04/16/how-to-make-privacy-friendly-contact-forms/
        - they say, they never transfer any data to third party servers: https://contactform7.com/faq/#does_contact_form_7_track_our_personal_data_by_stealth_or_transfer_the_data_to_external_servers
        - ⚠ do not use with
            - reCAPTCHA (Google)
            - Akismet (Automattic)
            - Constant Contact (Endurance International Group)
            - Sendinblue
            - … or any other third party
        - you must get the consent of the user in the moment they use the form (read the privacy terms)  
    - terms checked: ✓ `GPLv2`
        - https://plugins.svn.wordpress.org/contact-form-7/
    - conclusion: ✓ ok
- links
    - https://wordpress.org/plugins/contact-form-7/ 
    - https://contactform7.com
    - [Issue in Jira](https://join-us-4-health.atlassian.net/browse/HP-59)

### Elementor-Plugins
#### Elementor
- description
    - website builder plugin - drag/drop content, easy editing, moderation helper
- check
    - last checked: `06.04.2021, winterb`
    - Version: `3.1.4`
    - privacy checked: ✓ ok
        - ⚠ "Shared Usage Data" (https://elementor.com/help/share-usage-data/)
            - Data: `Server software & version; MySQL version; PHP settings & version; WordPress version; WordPress debug mode; WordPress memory limit; WordPress max upload size; WordPress settings (permalink structure, multisite, language, theme, plugins); Site URL; Admin Email; Elementor plugin usage data`
            - Disable data usage in: `Dashboard → Elementor → Settings and unchecking "Usage Data Tracking"`
    - terms checked: ✓ `GPLv3`
        - https://github.com/elementor/elementor
        - https://plugins.svn.wordpress.org/elementor/
    - conclusion: ✓ ok
- links
    - https://wordpress.org/plugins/elementor/
    - https://elementor.com/
    - [Issue in Jira](https://join-us-4-health.atlassian.net/browse/HP-61)

#### Elementor Pro
- description
    - pro-features for plugin `Elementor`
- check
    - last checked: `06.04.2021, winterb`
    - version `3.2.1`
    - privacy checked: ✓ ok
        - see plugin `Elementor` for reference, I(winterb) think, we have the same rules here
        - brings support for other third-party-providers
            - `MailChimp; ActiveCampaign; ConvertKit; Campaign Monitor; HubSpot; Zapier; donReach; Drip; GetResponse; Adobe TypeKit; reCAPTCHA; Facebook SDK; Slack; MailerLite; Discord; Honeypot`
            - ⚠ highly privacy relevant
    - terms checked: ❗ seems to be proprietary; paid license
    - conclusion: ❓ maybe
        - do we need this?
            - Answer by S4P: yes
        - who pays for the license?
            - S4P will pay for it
- links
    - https://elementor.com/
    - *there is no WordPress plugin-page for this plugin*
    - [Issue in Jira](https://join-us-4-health.atlassian.net/browse/HP-63)

#### Elementor Addon Elements
- description
    - adds more elements, effects, things to the `Elementor`-plugin
- check
    - last checked: `06.04.2021, winterb`
    - version: `1.11.4`
    - privacy checked: ❌ (404 privacy not found)
        - ⚠ attention with external services like GoogleMaps and Twitter
        - ⚠ there is exactly one sentence on the homepage about privacy:
            - “The customer acknowledges that it is necessary for WebTechStreet to collect, process, and use customer data in order to process orders and purchases and for the website to function correctly.“
            - this could mean anything
        - ⚠ no privacy statement on the homepage
        - ⚠ searching for `privacy` on the help page brings only `Primary` results…
    - terms checked: ✓ `GPLv2`
        - https://plugins.svn.wordpress.org/addon-elements-for-elementor-page-builder/
    - conclusion: ❌ do not use
        - ❌ using third party services, there should be at least some information on data processing
- links
    - https://wordpress.org/plugins/addon-elements-for-elementor-page-builder/
    - https://www.elementoraddons.com/elements-addon-elements/
    - [Issue in Jira](https://join-us-4-health.atlassian.net/browse/HP-62)

### Email Subscribers & Newsletters
- description
    - provides a simple locally hosted newsletter plugin without data transfer
- check
    - last checked: `26.05.2021, winterb`
    - version: `4.7.3`
    - privacy checked: ✓ ok
        - [all data is stored locally on our server in database-tables](https://www.icegram.com/documentation/es-gdpr-what-data-email-subscribers-stores-on-your-end/)
        - [enable the consent-checkbox](https://www.icegram.com/documentation/es-gdpr-how-to-enable-consent-checkbox-in-the-subscription-form/)
        - users can unsubscribe via link in the newsletter
        - [provides double-opt-in](https://www.icegram.com/documentation/opt-in-types/)
    - terms checked: ✓ `GPLv3`
        - https://plugins.svn.wordpress.org/email-subscribers/
    - conclusion: ✓ ok
- links
    - https://wordpress.org/plugins/email-subscribers/
    - https://www.icegram.com/knowledgebase_category/email-subscribers
    - [Issue in Jira](https://join-us-4-health.atlassian.net/browse/HP-100)

### GDPR Cookie Consent
- description
    - display a cookie banner and automatically block all scripts, not chosen by the user
- check
    - last checked: `24.03.2021, winterb`
    - version: `2.0.1`
    - privacy checked: ✓ ok
        - saves the consent of the user in session-cookies
    - terms checked: ✓ `GPLv3`
        - https://plugins.svn.wordpress.org/cookie-law-info/
    - conclusion: ❌ do not use
        - rejecting the use of cookies is not as simple as accepting it
            - there must be a button like “reject all optional cookies“
        - the cookie banner text is more like a consent, not an information.
            - it must be an information to get the free choice of the user
- links
    - https://wordpress.org/plugins/cookie-law-info/
    - https://www.webtoffee.com/product/gdpr-cookie-consent/
    - [Issue in Jira](https://join-us-4-health.atlassian.net/browse/HP-64)

### Matomo Analytics Ethical Stats
- description
    - analyse user interaction with the website
    - it's possible to use without saving personal data of the users and without using cookies
- check
    - last checked: `26.05.2021, winterb`
    - version: `4.3.0`
    - privacy checked: ✓ ok
        - ⚠ [privacy configuration](https://matomo.org/docs/privacy-how-to/)
        - ⚠ [security configuration](https://matomo.org/docs/security-how-to/)
        - ⚠ [configuring Matomo, so that no cookies are used and no personal data is stored](https://matomo.org/faq/new-to-piwik/how-do-i-use-matomo-analytics-without-consent-or-cookie-banner/)
    - terms checked: ✓ `GPLv3 or later`
        - https://plugins.svn.wordpress.org/matomo/
    - conclusion: ✓ ok, if the configuration is strict
- links
    - https://wordpress.org/plugins/matomo/
    - https://matomo.org/installing-matomo-for-wordpress/
    - [Issue in Jira](https://join-us-4-health.atlassian.net/browse/HP-101)

### Newsletter
- description
    - provide a Newsletter-Frontend inside WordPress
- check
    - last checked: `04.05.2021, winterb`
    - version: `7.1.4`
    - privacy checked:
        - [their explanation on "GDPR ready"](https://www.thenewsletterplugin.com/documentation/subscription/gdpr-compliancy/)
            - data is stored locally, never transferred to the plugins provider company
            - provides double-opt-in
            - get consent via privacy-checkbox
            - ⚠ "Newsletter collects IP addresses at the moment of subscription and whenever a user performs an action on newsletters, if tracking is active"
                - minimise data → disable tracking!
            - provides users data export
            - users have an own configuration panel
            - ⚠ "At this moment, Newsletter subscribers do not have the ability to delete their own data"
                - "You can delete the whole subscription from the administration panels."
            - ⚠ External delivery services and hosting providers
                - do not use external delivery services without DPA!
    - terms checked: ✓ `GPLv2 or later`
        - https://plugins.svn.wordpress.org/newsletter/
    - conclusion: ❓ maybe
        - ⚠ not a word on using third party services like Akismet for SPAM-check in their privacy statement
        - ⚠ not a word on using tracking tech to get information on 'opening the newsletter' etc.
        - ⚠ unsubscribing a user is a **manual act** for us
        - we can use it only, IF…
            - we do deletion manually and communicate this transparent to the user (as de facto EVERY other newsletter does this with a simple token, this is very bad advertisement for this plugin)
            - we are able to disable…
                - tracking
                - using of any third-party-service
- links
    - https://wordpress.org/plugins/newsletter/
    - https://www.thenewsletterplugin.com/
    - [Issue in Jira](https://join-us-4-health.atlassian.net/browse/HP-96)

### One Click Accessibility
- description
    - enhance accessibility of the website
    - provides technical help for screen-readers as well as high-contrast configuration for readability
- check
    - last checked: `24.03.2021, winterb`
    - version: `2.0.3`
    - privacy checked: ✓ `no processing of personal data found`
    - terms checked: ✓ `GPLv2 or later`
        - https://github.com/pojome/one-click-accessibility/
    - conclusion: ✓ ok
- links
    - https://wordpress.org/plugins/pojo-accessibility/
    - https://wpaccessibility.io/?utm_source=wp-plugins&utm_campaign=plugin-uri&utm_medium=wp-dash
    - [Issue in Jira](https://join-us-4-health.atlassian.net/browse/HP-65)

### Polylang
- description
    - create multilingual pages
- check
    - last checked: `06.04.2021, winterb`
    - version: `3.0.3`
    - privacy checked: ✓ ok
        - ⚠ attention with any auto-translate
    - terms checked: ✓ `GPLv3 or later`
        - https://plugins.svn.wordpress.org/polylang/ 
- conclusion: ✓ ok
- links
    - https://wordpress.org/plugins/polylang/ 
    - https://polylang.pro/privacy-policy/
    - [Issue in Jira](https://join-us-4-health.atlassian.net/browse/HP-70)

### WP Event Manager
- description
    - adds event listing functions
- check
    - last checked: `06.04.2021, winterb`
    - version: `3.1.19`
    - privacy checked: ✓ `ok`
        - ⚠ do not sync/connect with third party providers like google-calendar
    - terms checked: ✓ `GPLv3`
        - https://plugins.svn.wordpress.org/wp-event-manager/ 
    - conclusion: ✓ ok
- links
    - https://wordpress.org/plugins/wp-event-manager/
    - https://www.wp-eventmanager.com/