# WordPress-Installation for the Website of the Project JoinUs4Health

<!-- TOC START min:1 max:4 link:true asterisk:false update:true -->
- [WordPress-Installation for the Website of the Project JoinUs4Health](#wordpress-installation-for-the-website-of-the-project-joinus4health)
    - [Overview](#overview)
    - [WordPress-Configuration](#wordpress-configuration)
        - [Plugins](#plugins)
        - [Disable Avatars](#disable-avatars)
        - [Privacy Statement](#privacy-statement)
    - [WordPress-Plugins used](#wordpress-plugins-used)
        - [WordPress-Plugin-Configuration](#wordpress-plugin-configuration)
            - [Configuration Elementor and Elementor Pro](#configuration-elementor-and-elementor-pro)
            - [Configuration TranslatePress](#configuration-translatepress)
            - [Configuration Icegram Express Pro](#configuration-icegram-express-pro)
            - [Configuration Yoast SEO](#configuration-yoast-seo)
- [Attachments](#attachments)
    - [Attachment: WordPress-Plugins-Checks](#attachment-wordpress-plugins-checks)
        - [Contact Form 7](#contact-form-7)
        - [Elementor-Plugins](#elementor-plugins)
            - [Elementor](#elementor)
            - [Elementor Pro](#elementor-pro)
            - [Elementor Addon Elements](#elementor-addon-elements)
        - [GDPR Cookie Consent](#gdpr-cookie-consent)
        - [Icegram Express Pro](#icegram-express-pro)
        - [JoinUs4Health newsletter consents](#joinus4health-newsletter-consents)
        - [Matomo Analytics Ethical Stats](#matomo-analytics-ethical-stats)
        - [Newsletter](#newsletter)
        - [One Click Accessibility](#one-click-accessibility)
        - [Polylang](#polylang)
        - [TranslatePress - Multilingual](#translatepress---multilingual)
        - [WP Event Manager](#wp-event-manager)
        - [Yoast SEO](#yoast-seo)
<!-- TOC END -->

**Changelog**

| date       | editor  | changes                                                             |
| ---------- | ------- | ------------------------------------------------------------------- |
| 16.01.2023 | winterb | renamed Newsletter-Plugin to "Icegram Express Pro"; added settings  |
| 07.10.2022 | winterb | added "JoinUs4Health newsletter" plugin description consents        | 
| 20.07.2022 | winterb | Newsletter documentation                                            |
| 09.11.2021 | winterb | TranslatePress added and configured DeepL-Addon                     |
| 22.10.2021 | winterb | TranslatePress configuration                                        |
| 30.09.2021 | winterb | checked Yoast SEO Plugin                                            |
| 23.09.2021 | winterb | checked TranslatePress-Base-Plugin, rechecked Polylang              |
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
This is a list of checked and approved plugins used within our website:

- Elementor-Plugins
    - Elementor
    - Elementor Pro
- Icegram Express Pro
- JoinUs4Health newsletter consents
- One Click Accessibility
- TranslatePress
- Yoast SEO

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
#### Configuration TranslatePress
- installed Add-Ons (inside the Plugin)
    - [Multiple Languages](https://translatepress.com/docs/addons/multiple-languages/?utm_source=wpbackend&utm_medium=clientsite&utm_content=add-on-page&utm_campaign=TRP)
        - removes the anti-feature of only having two languages
    - [Translator Accounts](https://translatepress.com/docs/addons/translator-accounts/?utm_source=wpbackend&utm_medium=clientsite&utm_content=add-on-page&utm_campaign=TRP)
        - removes the anti-feature that only administrators can edit content
    - [Automatic User-Language Detection](https://translatepress.com/docs/addons/automatic-user-language-detection/?utm_source=wpbackend&utm_medium=clientsite&utm_content=add-on-page&utm_campaign=TRP)
        - tries to determine the users preferred language by browser settings and IP address
        - ⚠ The visitor’s IP address is searched in the GeoLite2 database to determine the country from which the user accessed the website.
            - the IP-address cannot be used!
    - [Browse As User Role](https://translatepress.com/docs/addons/browse-as-role/?utm_source=wpbackend&utm_medium=clientsite&utm_content=add-on-page&utm_campaign=TRP)
        - helps translators to see the site from the users perspective
- Settings → TranslatePress
    - General
        - **IMPORTANT**: Method of language detection: Only by browser language
    - Advanced
        - Do not translate certain paths
            - `/privacy-statement/*`
            - `/legal-notice/*`

##### using Deepl to translate contents on the webpage
- [Pricing](https://www.deepl.com/en/pro#developer)
    - needed: an API Key - we use the free version limited to 500'000 Chracters/Month
- install Add-On (inside the Plugin)
    - [DeepL Automatic Translation](https://translatepress.com/docs/addons/deepl-automatic-translation/?utm_source=wpbackend&utm_medium=clientsite&utm_content=add-on-page&utm_campaign=TRP)
- Settings → TranslatePress → Automatic Translation
    - Enable Automatic Translation: Yes
    - Translate Engine: DeepL
        - DeepL API Type: Free
        - DeepL API Type: *see KeePassXC*
    - Block Crawlers: Yes
    - Limit machine translation per day: 100'000

#### Configuration Icegram Express Pro
- requirements overview
    - data needed: E-Mail-Address only
    - sign up with double-opt-in (validate E-Mail-Address)
    - no tracking
    - no third-party service
- Icegram Express → Settings
    - General
        - Opt-in type: `Double Opt In`
        - Track opens: `disabled`
        - Track clicks: `disabled`
        - Google Analytics UTM tracking: `disabled`
        - Plugin usage tracking: `disabled`
        - Nudge people to subscribe while leaving a comment or placing an order?: `disabled`
    - Email Sending
        - *update cron configuraion to our need and the e-mail limits of the provider*
        - Send emails at most every: `15 minutes`
        - Maximum emails to send in an hour: `18`
        - Maximum emails to send at once: `18`
        - Select a mailer to send mail: *use SMTP with the corect settings; check SPF, DMARC, DKIM configuration*
    - Security
        - Track IP address: `disabled`
        - Block known attackers: `enabled`
        - Block temporary / fake emails: `enabled`
    - API
        - Enable API: `disabled`
    - Access Control
        - *update access configuraion to our need and privcy concept*
- Icegram Express → Campaigns
    - add legal part to all newsletter templates
- Icegram Express → Forms
    - require E-Mail-Address
    - Name is not required
    - require consent in subscribe-form
- Icegram Express → Workflows
    - add Workflows for the following topics
        - Send confirmation email
            - E-Mail with the activation token for new subscribers
        - Send welcome email when someone subscribes
            - E-Mail with Hello-Message for validated E-Mail-Addresses
        - Delete personal data if somebody unsubscribes
            - if a user unsubscribes, the personal data must be deleted
        - Notify admin when campaign is sent
            - Information to tech. Admin on sent newsletter, add count of recipients 

#### Configuration Yoast SEO
- SEO
    - General
        - Featured
            - disabled `Usage tracking` and `Slack sharing`
        - Integrations
            - disabled `Semrush integration` and `Ryte integration`
    - Social
        - disabled `Facebook` and `Twitter`

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
            - Data: `Server software & version; MariaDB version; PHP settings & version; WordPress version; WordPress debug mode; WordPress memory limit; WordPress max upload size; WordPress settings (permalink structure, multisite, language, theme, plugins); Site URL; Admin Email; Elementor plugin usage data`
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

### Icegram Express Pro
- description
    - provides a simple locally hosted newsletter plugin without data transfer
    - was renamed from "Email Subscribers & Newsletters"
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

### JoinUs4Health newsletter consents
- description
    - this plugin provides consent-saving, what is legally necessary for the newsletter-plugin
    - this plugin was developed in this project

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
    - last checked: `23.09.2021, winterb`
    - version: `3.1.1`
    - requirements checked
        - ✓ can handle four languages → ok
        - ✓ content can be edited by WordPress-Users with the Role `Editor`
            - @winterb: WordPress-Editor is working; couldn't start the Elementor-Editor in the test environment, could also be a problem with Elementor
        - ✓ content can be edited without publishing (i.e. EN-site is online, while we are still working on the DE-version)
    - privacy checked: ✓ ok
        - ⚠ check Cookies and Local/Session Storage before productive use
        - ⚠ attention with any auto-translate
        - no personal data is collected ([link](https://polylang.pro/doc/is-polylang-gdpr-compliant/))
    - terms checked: ✓ `GPLv3 or later`
        - https://plugins.svn.wordpress.org/polylang/ 
- conclusion: ✓ ok
    - Info 22.10.2021 winterb: we cannot use Polylang, because of problems with the used content builder Elementor
- links
    - https://wordpress.org/plugins/polylang/ 
    - https://polylang.pro/privacy-policy/
    - [Documentation](https://polylang.pro/doc/)
    - [Issue in Jira](https://join-us-4-health.atlassian.net/browse/HP-70)

### TranslatePress - Multilingual
- description
    - create multilingual pages
    - difference to Polylang: "usability"
        - "TranslatePress is easier to use and more intuitive altogether. No more switching between the editor, string translation interfaces or badly translated plugins. You can now translate the full page content directly from the front-end. This makes TranslatePress a great alternative to plugins like Polylang and WPML." ([link](https://wordpress.org/plugins/translatepress-multilingual/#description))
- check
    - last checked: `23.09.2021, winterb`
    - version: `2.1.2`
    - requirements checked
        - ❌ can handle four languages → ok
            - only with an extra paid plugin "TranslatePress Advanced Add-ons"
            - "To add more than two languages and support for SEO Title, Description, Slug and more check out TranslatePress Advanced Add-ons."
        - ❌ content can be edited by WordPress-Users with the Role `Editor`
            - only with an extra paid plugin "Translator Accounts add-on"
                - "Using the Translator Accounts Add-on you can create or allow existing users to translate the site without admin rights. The Translator Accounts add-on is only available with a Developer or Business license." ([link](https://translatepress.com/docs/addons/translator-accounts/))
        - ❓ content can be edited without publishing (i.e. EN-site is online, while we are still working on the DE-version)
            - "Editorial control allowing you to publish your language only when all your translations are done" ([link](https://wordpress.org/plugins/translatepress-multilingual/))
            - @winterb: cannot find an option for that in the running test system
    - privacy checked: ❓ maybe
        - ⚠ check Cookies and Local/Session Storage before productive use
        - ⚠ attention with any auto-translate and third-party services
        - ⚠ no privacy policy or any info on the data processed found for the plugin
        - ⚠ advertises paid add-ons
    - terms checked: ✓ `GPLv2 or later`
        - https://plugins.svn.wordpress.org/translatepress-multilingual/
    - conclusion: ❓ maybe not
- links
    - https://wordpress.org/plugins/translatepress-multilingual/
    - https://translatepress.com/, Romania
    - [Documentation](https://translatepress.com/docs/translatepress/?utm_source=wp.org&utm_medium=tp-description-page&utm_campaign=TPFree)
    - [Issue in Jira](https://join-us-4-health.atlassian.net/browse/HP-107)

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

### Yoast SEO
- description
    - adds different functionalities to enhance the findability of the page (meta tags, SEO-magic)
- check
    - last checked: `30.09.2021, winterb`
    - version: `17.2.1`
    - privacy checked: ✓ `ok`
        - "The Yoast plugins do not process, collect, or store any of that personal data at Yoast premises or servers. Every analysis performed on your content is done on your site and none of your content is used by Yoast off-site." ([link](https://yoast.com/help/do-i-need-a-dpa-when-i-purchase-from-yoast/))
        - https://yoast.com/help/gdpr/
        - https://yoast.com/innovations/privacy-by-design/
        - ⚠ talk about the use of third party products like SEMrush, Ryte before using it in any way
    - terms checked: ✓ `GPLv3`
        - https://plugins.svn.wordpress.org/wordpress-seo/
    - conclusion: ✓ ok
- links
    - https://wordpress.org/plugins/wordpress-seo/
    - https://yoast.com
    - [Issue in Jira](https://join-us-4-health.atlassian.net/browse/HP-133)
