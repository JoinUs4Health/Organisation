<!-- TOC START min:1 max:3 link:true asterisk:false update:true -->
- [WordPress-Server-Installation for the Platform of the Project JoinUs4Health](#wordpress-server-installation-for-the-platform-of-the-project-joinus4health)
    - [Overview](#overview)
    - [Server-Installation](#server-installation)
        - [WordPress installation](#wordpress-installation)
    - [Server-Configuration](#server-configuration)
        - [Safety](#safety)
        - [Security](#security)
- [WordPress-internal Installation/Configuration](#wordpress-internal-installationconfiguration)
    - [Overview](#overview-1)
    - [WordPress-Configuration](#wordpress-configuration)
        - [Plugins](#plugins)
        - [Disable Avatars](#disable-avatars)
        - [Privacy Statement](#privacy-statement)
    - [WordPress-Plugins used](#wordpress-plugins-used)
- [WordPress Step-By-Step-Installation](#wordpress-step-by-step-installation)
    - [Install new wordpress instance on netcup](#install-new-wordpress-instance-on-netcup)
    - [Installing theme](#installing-theme)
    - [Install plugin BuddyPress, bbPress](#install-plugin-buddypress-bbpress)
    - [Fetch locally LudicrousDB from git](#fetch-locally-ludicrousdb-from-git)
    - [Install joinus4health plugin](#install-joinus4health-plugin)
    - [Install Easy WP SMTP plugin & configure it](#install-easy-wp-smtp-plugin--configure-it)
    - [Setup menu & page](#setup-menu--page)
- [Attachments](#attachments)
    - [Attachment: WordPress-Plugins-Checks](#attachment-wordpress-plugins-checks)
        - [bbPress](#bbpress)
        - [BuddyPress](#buddypress)
        - [TaskBreaker - Group Project Management](#taskbreaker---group-project-management)
        - [Mind maps](#mind-maps)
        - [JoinUs4Health](#joinus4health)
        - [WPBruiser aka Goodbye-Captcha and WPBruiser BuddyPress Extension](#wpbruiser-aka-goodbye-captcha-and-wpbruiser-buddypress-extension)
<!-- TOC END -->

**Changelog**

| date       | editor  | changes                                                    |
| ---------- | ------- | ---------------------------------------------------------- |
| 22.07.2022 | winterb | checked WPBruiser-Plugin + Extension                       |
| 06.06.2022 | Jakub   | added information on 'JoinUs4Health'-Plugins               |
| 12.04.2022 | winterb | added WordPress-plugins used an plugin-checks              |
| 07.04.2022 | winterb | added PHP Settings                                         |
| 06.04.2022 | winterb | general update to the current state, merged server install |
| 04.04.2022 | Jakub   | updated Step-By-Step-Installation                          |
| 04.03.2022 | Jakub   | started Step-By-Step-Installation                          |
| 28.01.2022 | winterb | added general configuration and plugin checks              |
| 19.01.2022 | winterb | started documentation                                      |


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
- `post_max_size` → `16M`
- `upload_max_filesize` → `10M`

### Safety
#### Automatic Backup
- enabled in control panel → Account → Back Up Websites → Schedule
    - create every 24h an incremental Backup
    - create a full backup every seven days
    - store up to three full backups
    - exclude specific files from backup: `/.trash`, `/wordpress-backups`
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
    - update Plugins: Force update and deactivate vulnerable plugins instead of updating them
    - update Themes: Defined individually, but security updates are autoinstalled; Enable autoupdates by default for new themes installed via WordPress Toolkit

#### Checked Security
- for WordPress in the WordPress-Toolkit:
    - ❌ Disable scripts concatenation for WordPress admin panel
        - not enabled, because it can cause problems with the AdminPanel in WordPress
    - ✓ Restrict access to files and directories
    - ✓ Configure security keys
    - ✓ Block directory browsing
    - ✓ Forbid execution of PHP scripts in the wp-includes directory
    - ✓ Forbid execution of PHP scripts in the wp-content/uploads directory
    - ✓ Block unauthorized access to wp-config.php
    - ✓ Turn off pingbacks
    - ✓ Disable PHP execution in cache directories
    - ✓ Disable file editing in WordPress Dashboard
    - ✓ Change default database table prefix
    - ✓ Enable bot protection
    - ✓ Block access to sensitive files
    - ✓ Block access to potentially sensitive files
    - ✓ Block access to .htaccess and .htpasswd
    - ✓ Block author scans
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
This is a list of checked and approved extenal plugins used within our website:

- bbPress
- BuddyPress
- TaskBreaker - Group Project Management

---

# WordPress Step-By-Step-Installation

## Install new wordpress instance on netcup
*see above*

## Installing theme
- Install astra theme using search in wordpress
- Copy astra-child theme to `wp-content/themes`
- Activate Ju4H theme
- Settings → General:
    - Set up title: `Join Us 4 Health`
    - Set up tagline: like above
    - Check Membership as: `Anyone can register`
    - Site language: `English`
    - Date format: `Y-m-d`
    - Time format: `H:i`
    - Week Starts On: `Monday`
- Settings → Discussion:
    - Avatar Display: disable
- Settings → General (again, but now installing languages):
    - Select one of language which must be installed: Deutsch,
      English (UK), Nederlands, Polski
    - Save Changes and repeat step above, till you will have
      installed all the languages mentioned above on the select
      box list under ‘Installed’
- Appeareance → Astra options:
    - Header Builder:
        - Primary header settings:
            - Height: `70px`
    - Design:
        - Margin bottom: `40px`
        - Bottom border size: `0px`
        - Background: `#efe733`
- Header Builder → Site Title & Logo:
    - Upload logo
    - Logo width: `112px`
    - Uncheck display site title & site tagline
- Header Builder → Primary Menu:
    - Design:
        - Border Width: 0 0 0 0 px
        - Menu Color → Text Link: `R:0 G:0 B:0 A:50%` / `#000000`
          / `#000000`
        - Menu Font:
            - Family: `Poppins`
            - Weight: `Medium 500`
- Global → Typography:
    - Body Font Family: `DM Sans`
    - Variants: `Normal 400`, `Medium 500`, `Bold 700`
    - Size: `15px`
    - Weight: `Normal 400`
    - Heading Font Family: `DM Sans`
    - Variants: `Bold 700`
    - Weight: `Bold 700 Inherit`
    - H1 Size: `40px`
    - H2 Size: `30px`
    - H3 Size: `25px`
    - H4 Size: `20px`
    - H5 Size: `18px`
    - H6 Size: `15px`
- Sidebar:
    - Default layout: No sidebar
    - Pages: Default
    - Blog Posts: Default
    - Archives: Default
- Global → Container:
    - Container Width: `1230px`
    - Layout: Full Width / Contained
    - Page Layout: Full Width / Contained
- Global → Colors:
    - Text color: `#3a3a3a`
    - Theme color: `#efe733`
    - Link color: `#fb7d66`
    - Link Hover Color: `#ff6448`
    - Heading Color: `#000000`
    - Content background: `#ffffff`
- Widgets:
    - Remove all widgets
- Footer Builder:
    - Remove all bottom sections

## Install plugin BuddyPress, bbPress
- Permalink settings:
    - Common Settings → Post Name
- BuddyPress:
    - Components:
        - Extended Profiles: Enable
        - Account Settings: Enable
        - Private Messaging: Enable
        - Activity Streams: Enable
        - Notifications: Enable
        - User Groups: Enable
    - User Groups: Enable
- Options:
    - Main settings:
        - Toolbar: Enable
        - Account Deletion: Enable
        - Template Pack: BuddyPress Legacy
    - Member Settings:
        - Profile Photo Uploads: enable
        - Cover Images Uploads: disable
        - Invitations: disable
    - Profile Settings:
- Profile Syncing: enable
- Groups Settings:
    - Group Creation: disable
    - Group Photo Uploads: enable
    - Group Cover Image Uploads: disable
- Activity Settings:
    - Post Comments: enable
    - Activity auto-refresh: enable
- Go to Users → Profile fields and at Base (Primary) ‘Add New
  Field’:
    - Requirment: Required
    - Signups: enable
    - Visibility: Everyone
    - Autolink: enabled
    - Sort Order: Custom
    - Name: Preferred language
    - Type: Drop Down Select Box
    - With options: DE, PL, EN, NL
    - Set EN as Default Value

## Fetch locally LudicrousDB from git
- Clone repo by `git clone git@github.com:JoinUs4Health/ludicrousdb-ju4h.git` command or download zip `https://github.com/JoinUs4Health/ludicrousdb-ju4h/archive/refs/heads/master.zip`
- Copy content of `drop-in` folder to main plaform folder
- Edit `wp-config.php` in main wordpress directory, COPY (for later purpouse) and remove first 39 lines, especially definitions:
    ```php
     define( 'DB_NAME', 'xxxx' );
     define( 'DB_USER', 'xxxx' );
     define( 'DB_PASSWORD', 'xxxx' );
     define( 'DB_HOST', 'xxxx' );
     define( 'DB_CHARSET', 'xxxx' );
     define( 'DB_COLLATE', 'xxxx' );
    ```
- Create second database and put to it two tables: `{prefix}_signups`,`{prefix}_users` & `{prefix}_usermeta`.
- Edit `db-config.php` from main wordpress catalog. Edit this configurations and fill it with proper auth data. At `xxx_1` & `xxx_2` should be placed credentials database data like database host, user, database password and database name.
    ```php
    $wpdb->add_database(array(
        'host'     => "xxx_1",     // If port is other than 3306, use host:port.
        'user'     => "xxx_1",
        'password' => "xxx_1",
        'name'     => "xxx_1",
        'dataset'  => "1",
        'write'    => 1,
        'read'     => 1,
        'timeout'  => 1.0,
    ));

    $wpdb->add_database(array(
        'host'     => "xxx_2",     // If port is other than 3306, use host:port.
        'user'     => "xxx_2",
        'password' => "xxx_2",
        'name'     => "xxx_2",
        'dataset'  => "2",
        'write'    => 1,
        'read'     => 1,
        'timeout'  => 1.0,
    ));
    ```
- After install ludicrousdb refresh page, all things should be working.

## Install joinus4health plugin
- Copy folder with plugin to `wp-content/plugins`
- Activate plugin in wordpress panel

## Install Easy WP SMTP plugin & configure it
- From Email Address: created mail on plesk
- From Name: Juin us 4 Health
- Type of Encryption: SSL/TLS
- SMTP Host: host of mail server
- SMTP Port: 465
- SMTP Authentiaction: YES
- SMTP Username & Password: fill-in with data
- Encrypt Password: disable
- Allow Insecure SSL Certificates: enable

## Setup menu & page
- Add pages at Pages → Add New:
    - Activation
    - Activity
    - Add new suggestion at /ju4hsuggestion-new/
    - Event catalog
    - Members
    - Privacy Policy
    - Report repository
    - Sign up at /sign-up/
    - Teams at /groups/
- BuddyPress bind pages:
    - Pages → Directories:
        - Members → Members
        - Activity Stream → Activity
        - User Groups → Working group
        - Projects → Report Repository
    - Pages → Registration:
        - Register → Sign up
        - Activate -→ Activation

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

### bbPress
- description
    - this plugin provides the functionality of a discussion board
- check
    - last checked: `12.04.2022, winterb`
    - version: `2.6.9`
    - privacy checked: ✓ `ok`
      - no explicit information found, seems to run locally only
      - officially developed by the WordPress founders and community
    - terms checked: ✓ `GPLv2 or later`
      - https://plugins.svn.wordpress.org/bbpress/
    - conclusion: ✓ ok
- links
    - https://wordpress.org/plugins/bbpress/
    - https://bbpress.org/

### BuddyPress
- description
    - this plugin provides the functionality of a locally running social network software
    - handles registration and user interactions
- check
    - last checked: `12.04.2022, winterb`
    - version: `10.2.0`
    - privacy checked: ✓ `ok`
      - no explicit information found, seems to run locally only
      - officially developed by the WordPress community
    - terms checked: ✓ `GPLv2 or later`
      - https://plugins.svn.wordpress.org/buddypress/
    - conclusion: ✓ ok
- links
    - https://wordpress.org/plugins/buddypress/
    - https://buddypress.org/

### TaskBreaker - Group Project Management
- description
    - TaskBreaker is project management plugin for WordPress.
    - TaskBreaker is integrated with BuddyPress.
- check
    - last checked: `12.04.2022, winterb`
    - version: `1.5.1`
        - ⚠ version is four years old!
        - we scheduled this in the IT-Meeting on 10.05.2022, unfortunately TaskBreaker seems to be the best possible option (RK, DNFP-13)
    - privacy checked: ✓ `ok`
      - no explicit information found, seems to run locally only
      - officially developed by the WordPress community
    - terms checked: ✓ `GPLv2 or later`
      - https://plugins.svn.wordpress.org/taskbreaker-project-management/
    - conclusion: ✓ ok
- links
    - https://wordpress.org/plugins/taskbreaker-project-management/
    - https://github.com/codehaiku/taskbreaker-project-management

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

### JoinUs4Health
- description
    - this plugin provides mainly functionality for Suggestions, Tasks and Topics and gives customization for installed plugins
    - this plugin was developed in this project
- details
    - adding Suggestion post type
    - adding Topic post type
    - adding Task post type
    - adding Slide post type (for carousel on home page)
    - adding routing for 'New idea/suggestion'
    - adding routing for home page of wordpress
    - adding custom archive page for 'Suggestion' post type
    - adding custom archive page for 'Topic' post type
    - adding custom archive page for 'Task' post type
    - implements functions for formatting/displaying time
    - adds custom JavaScript scripts
    - handles changing language of webpage firstly based on browser language and secondly if user choosed any custom language by yourself displaying webpage in language stored in cookie
    - implements functions for displaying custom fields of posts based on selected current language
    - handles redirecting to any child page based on its language. If invoked page has child page with selected current language page will be redirected to this child page
    - rewrites username at sign up page to username from BuddyPress forum plugin, and does the same on profile update page
    - hides profile page from BuddyPress (only visible for owner and administrator)
    - hides members list from BuddyPress
    - changes e-mail recipient to contact@joinus4health.eu
    - changes e-mail content of notify about new comment for user and other users removing all of sensitive data like e-mail addresses and IP addresses
    - turns off WordPress API and BuddyPress API
    - removes IP and e-mail address from comment table list at WordPress panel

### WPBruiser aka Goodbye-Captcha and WPBruiser BuddyPress Extension
- description
    - WPBruiser is a local running Captcha Plugin for human validation (stop bots).
    - WPBruiser BuddyPress Extension integrates WPBruiser in the running BuddyPress system.
- check
    - WPBruiser
        - last checked: `22.07.2022, winterb`
        - version: `3.1.43`
        - privacy checked: ✓ `ok`
            - ⚠ current version is two years old!
            - no explicit information found, seems to run locally only
        - terms checked: ✓ `GPLv2 or later`
            - https://plugins.svn.wordpress.org/goodbye-captcha
        - other infos
            - ❌ WordPress claims: "This plugin hasn’t been tested with the latest 3 major releases of WordPress. It may no longer be maintained or supported and may have compatibility issues when used with more recent versions of WordPress.""
            - ❌ seems not to be maintained anymore: https://wordpress.org/plugins/goodbye-captcha/#reviews
        - conclusion: ✓ ok
    - WPBruiser BuddyPress Extension
        - last checked: `22.07.2022, winterb`
        - version: `3.1.39`
            - ⚠ current version is two years old! last update May 4, 2020.
        - privacy checked: ✓ `ok`
          - no explicit information found, seems to run locally only
        - terms checked: ❌ `proprietary`
          - https://plugins.svn.wordpress.org/taskbreaker-project-management/
        - conclusion: ✓ ok
- links
    - WPBruiser
        - https://wordpress.org/plugins/goodbye-captcha/
    - WPBruiser BuddyPress Extension
        - https://wpbruiser.com/downloads/buddypress/
