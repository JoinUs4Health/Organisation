# WordPress-Installation for the Project JoinUs4Health

<!-- TOC START min:1 max:4 link:true asterisk:false update:true -->
- [WordPress-Installation for the Project JoinUs4Health](#wordpress-installation-for-the-project-joinus4health)
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
<!-- TOC END -->

**Changelog**

| date       | editor  | changes                                        |
| ---------- | ------- | ---------------------------------------------- |
| 14.07.2021 | winterb | backup information; translated security checks |
| 09.07.2021 | winterb | added basic information                        |

## Overview
This document gives information about all configurations and installations in the Website-Server.
For the WordPress-internal configuration, please see the `WordPress-Installation`.

## Server-Installation
The Installation of the backend is done by the netcup GmbH.
JoinUs4Health uses the "managed server" for hosting the Website [joinus4health.eu](https://joinus4health.eu).

### WordPress installation
WordPress ist installed with a so called "WordPress-Toolkit" but without any special Plugins/Themes added.

The "WordPress-Toolkit" provides further possibilities to simplify certain WordPress-Jobs like Backup, Clone, Security-Check.
See the Configuration-part of this documentation fo details.

For the WordPress-internal configuration, please see the `WordPress-Installation`.

## Server-Configuration

### Safety
#### Automatic Backup
- enabled in [control panel → Konto → Website sichern → Planen](https://a2efa.webhosting.systems/smb/backup/list/domainId/548)
    - create every 24h an incremental Backup
    - create a full backup every seven days
    - store up to three full backups
    - content
        - files
        - databases
        - users
- last test of restore: 14.07.2021 by winterb and kondrackir

#### Offsite Backup
- there is no automatic offsite-backup
- once per month `winterb` will download a full-backup manually

### Security
#### Automatic Updates
- enabled for WordPress [WordPress-Toolkit](https://a2efa.webhosting.systems/modules/wp-toolkit/index.php/domain/list):
    - update WordPress: all major and minor versions
    - update Plugins: Yes
    - update Themes: Yes

#### Checked Security
- for WordPress in the [WordPress-Toolkit](https://a2efa.webhosting.systems/modules/wp-toolkit/index.php/domain/list):
    - ❌ "Skriptverkettung für WordPress-Administrator-Panel deaktivieren" (Disable script chaining for WordPress admin panel)
        - not enabled, because it can cause problems with the AdminPanel in WordPress
    - ❌ "Dateibearbeitung im WordPress-Dashboard deaktivieren" (Disable file editing in WordPress dashboard)
        - not enabled, because this function is needed by the admins
    - ❌ "Autorenscans blockieren" (Block author scans)
        - not enabled, because this can cause problems on pages with only one author
    - ✓ "Zugriff auf Dateien und Verzeichnisse einschränken" (Restrict access to files and directories)
    - ✓ "Sicherheitsschlüssel konfigurieren" (Configure security keys)
    - ✓ "Verzeichnissuche blockieren" (Block directory scanning)
    - ✓ "Ausführung von PHP-Skripts im Verzeichnis "wp-includes" nicht erlauben" (Do not allow execution of PHP scripts in "wp-includes" directory)
    - ✓ "Ausführung von PHP-Skripts im Verzeichnis "wp-content/uploads" nicht erlauben" (Do not allow execution of PHP scripts in "wp-content/uploads" directory)
    - ✓ "Nicht autorisierten Zugriff auf "wp-config.php" blockieren" (Block unauthorized access to "wp-config.php)
    - ✓ "Pingbacks deaktivieren" (Disable pingbacks)
    - ✓ "Schutz vor Hotlinks aktivieren" (Enable hotlink protection)
    - ✓ "Nicht verwendete Skriptsprachen deaktivieren" (Disable unused scripting languages)
    - ✓ "PHP-Ausführung in Cache-Verzeichnissen deaktivieren" (Disable PHP execution in cache directories)
    - ✓ "Standardpräfix von Datenbanktabellen ändern" (Change default prefix of database tables)
    - ✓ "Schutz vor Bots aktivieren" (Enable protection against bots)
    - ✓ "Zugriff auf sensible Dateien blockieren" (Block access to sensitive files)
    - ✓ "Zugriff auf potenziell sensible Dateien blockieren" (Block access to potentially sensitive files)
    - ✓ "Zugriff auf HTACCESS- und HTPASSWD-Datei blockieren" (Block access to HTACCESS and HTPASSWD file)
    - ✓ "Standardbenutzername des Administrators ändern" (Change default username of administrator)
