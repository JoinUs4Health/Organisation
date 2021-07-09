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

| date       | editor  | changes                 |
| ---------- | ------- | ----------------------- |
| 09.07.2021 | winterb | added basic information |

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
    - create a full backup every three days
    - store up to three full backups
    - content
        - files
        - databases
        - users

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
    - ❌ Skriptverkettung für WordPress-Administrator-Panel deaktivieren
        - not enabled, because it can cause problems with the AdminPanel in WordPress
    - ❌ Dateibearbeitung im WordPress-Dashboard deaktivieren
        - not enabled, because this function is needed by the admins
    - ❌ Autorenscans blockieren
        - not enabled, because this can cause problems on pages with only one author
    - ✓ Zugriff auf Dateien und Verzeichnisse einschränken
    - ✓ Sicherheitsschlüssel konfigurieren
    - ✓ Verzeichnissuche blockieren
    - ✓ Ausführung von PHP-Skripts im Verzeichnis "wp-includes" nicht erlauben
    - ✓ Ausführung von PHP-Skripts im Verzeichnis "wp-content/uploads" nicht erlauben
    - ✓ Nicht autorisierten Zugriff auf "wp-config.php" blockieren
    - ✓ Pingbacks deaktivieren
    - ✓ Schutz vor Hotlinks aktivieren
    - ✓ Nicht verwendete Skriptsprachen deaktivieren
    - ✓ PHP-Ausführung in Cache-Verzeichnissen deaktivieren
    - ✓ Standardpräfix von Datenbanktabellen ändern
    - ✓ Schutz vor Bots aktivieren
    - ✓ Zugriff auf sensible Dateien blockieren
    - ✓ Zugriff auf potenziell sensible Dateien blockieren
    - ✓ Zugriff auf HTACCESS- und HTPASSWD-Datei blockieren
    - ✓ Standardbenutzername des Administrators ändern
