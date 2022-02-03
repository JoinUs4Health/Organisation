<!-- TOC START min:1 max:4 link:true asterisk:false update:true -->
- [WordPress-Server-Installation for the Platform of the Project JoinUs4Health](#wordpress-server-installation-for-the-platform-of-the-project-joinus4health)
    - [Overview](#overview)
    - [Server-Installation](#server-installation)
        - [WordPress installation](#wordpress-installation)
    - [Server-Configuration](#server-configuration)
        - [Safety](#safety)
            - [Automatic Backup](#automatic-backup)
            - [Offsite Backup](#offsite-backup)
        - [Security](#security)
            - [Automatic Updates](#automatic-updates)
            - [Checked Security](#checked-security)
- [WordPress-internal Installation/Configuration](#wordpress-internal-installationconfiguration)
    - [Overview](#overview-1)
    - [WordPress-Configuration](#wordpress-configuration)
        - [Plugins](#plugins)
        - [Disable Avatars](#disable-avatars)
        - [Privacy Statement](#privacy-statement)
    - [WordPress-Plugins used](#wordpress-plugins-used)
        - [WordPress-Plugin-Configuration](#wordpress-plugin-configuration)
- [Attachments](#attachments)
    - [Attachment: WordPress-Plugins-Checks](#attachment-wordpress-plugins-checks)
        - [Mind maps](#mind-maps)
<!-- TOC END -->

**Changelog**

| date       | editor  | changes                                       |
| ---------- | ------- | --------------------------------------------- |
| 28.01.2022 | winterb | added general configuration and plugin checks | 
| 19.01.2022 | winterb | started documentation                         |


# WordPress-Server-Installation for the Platform of the Project JoinUs4Health
## Overview
This document gives information about all configurations and installations in the Platform-Server.
The WordPress-internal configuration can be found in the second chapter.

## Server-Installation
The Installation of the backend is done by the netcup GmbH.
JoinUs4Health uses a "managed private server" for hosting the Platform as a virtual server.

### WordPress installation
WordPress is installed with a so called "WordPress-Toolkit" but without any special Plugins/Themes added.

The "WordPress-Toolkit" provides further possibilities to simplify certain WordPress-Jobs like Backup, Clone, Security-Check.
See the Configuration-part of this documentation for details.

## Server-Configuration

### Safety
#### Automatic Backup
- enabled in control panel → Account → Back Up Websites → Schedule
    - create every 24h an incremental Backup
    - create a full backup every seven days
    - store up to three full backups
    - exclude specific files from backup: `/.trash`, `/.wordpress-backups`
    - content
        - files
        - databases
        - users

#### Offsite Backup
- there is no automatic offsite-backup
- at least once per month `winterb` will download a full-backup manually

### Security
#### Automatic Updates
- enabled for WordPress in [WordPress-Toolkit](https://a2efa.webhosting.systems/modules/wp-toolkit/index.php/domain/list):
    - update WordPress: all major and minor versions
    - update Plugins: Yes
    - update Themes: Yes

#### Checked Security
- for WordPress in the WordPress-Toolkit:
    - ❌ Disable scripts concatenation for WordPress admin panel
        - not enabled, because it can cause problems with the AdminPanel in WordPress
    - ❌ Block author scans
        - not enabled, because this can cause problems on pages with only one author
    - ✓ Forbid execution of PHP scripts in the wp-includes directory
    - ✓ Forbid execution of PHP scripts in the wp-content/uploads directory
    - ✓ Turn off pingbacks
    - ✓ Disable file editing in WordPress Dashboard
    - ✓ Enable bot protection
    - ✓ Block access to potentially sensitive files
    - ✓ Block access to .htaccess and .htpasswd
    - ✓ Restrict access to files and directories
    - ✓ Configure security keys
    - ✓ Block directory browsing
    - ✓ Block unauthorized access to wp-config.php
    - ✓ Disable PHP execution in cache directories
    - ✓ Change default database table prefix
    - ✓ Block access to sensitive files
    - ✓ Change default administrator's username

# WordPress-internal Installation/Configuration
## Overview
This part gives information about all configurations and installations in the WordPress-Instance.

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

- *TODO; Status: WIP; waiting for the documentation by the partner science4people*

### WordPress-Plugin-Configuration
*TODO; Status: WIP; waiting for the documentation by the partner science4people*

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

### Mind maps
- description
    - create mind maps to plan, take notes, visualise information, brainstorm, solve problems, study, and share information
    - languages: english, french
- check
    - last checked: `13.01.2022, winterb`
    - version: `2.18.0`
    - privacy checked: ✓ `ok`
        - no explicit information found, seems to run locally only
    - terms checked: ✓ `GPLv2 or later`
        - https://plugins.svn.wordpress.org/email-subscribers/
    - conclusion: ✓ ok
- links
    - https://wordpress.org/plugins/mind-maps/
