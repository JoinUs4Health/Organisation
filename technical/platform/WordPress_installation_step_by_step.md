# WordPress installation step by step
## Changelog

| date       | editor  | changes                                       |
| ---------- | ------- | --------------------------------------------- |
| 04.03.2022 | Jakub   | Created                                       | 

## Content
1. **Install new wordpress instance on netcup**

2. **Installing theme:**
   * Install astra theme using search in wordpress
   * Copy astra-child theme to `wp-content/themes`
   * Activate Ju4H theme
   * Set up title: `Join Us 4 Health`
   * Set up tagline: like above
   * Check Membership as: `Anyone can register`
   * Site language: `English`
   * Date format: `Y-m-d`
   * Time format: `H:i`
   * Week Starts On: `Monday`
   * Appeareance > Astra options:
     * Header Builder:
       * Primary header settings:
         * Height: `70px`
     * Design:
       * Margin bottom: `40px`
       * Bottom border size: `0px`
       * Background: `#efe733`
   * Header Builder > Site Title & Logo:
     * Upload logo
     * Logo width: `112px`
     * Uncheck display site title & site tagline
   * Header Builder > Primary Menu:
     * Design: 
       * Border Width: 0 0 0 0 px
       * Menu Color > Text Link: `R:0 G:0 B:0 A:50%` / `#000000` / `#000000`
       * Menu Font:
         * Family: `Poppins`
         * Weight: `Medium 500`
   * Global > Typography:
     * Body Font Family: `DM Sans`
     * Variants: `Normal 400`, `Medium 500`, `Bold 700`
     * Size: `15px`
     * Weight: `Normal 400`
     * Heading Font Family: `DM Sans`
     * Variants: `Bold 700`
     * Weight: `Bold 700 Inherit`
     * H1 Size: `40px`
     * H2 Size: `30px`
     * H3 Size: `25px`
     * H4 Size: `20px`
     * H5 Size: `18px`
     * H6 Size: `15px`
   * Sidebar:
     * Default layout: No sidebar
     * Pages: Default
     * Blog Posts: Default
     * Archives: Default
   * Global > Container:
     * Container Width: `1230px`
     * Layout: Full Width / Contained
     * Page Layout: Full Width / Contained
   * Global > Colors:
     * Text color: `#3a3a3a`
     * Theme color: `#efe733`
     * Link color: `#fb7d66`
     * Link Hover Color: `#ff6448`
     * Heading Color: `#000000`
     * Content background: `#ffffff`
   * Widgets:
     * Remove all widgets
   * Footer Builder:
     * Remove all bottom sections
 
3. **Install plugin BuddyPress, bbPress**
   * Permalink settings:
     * Common Settings > Post Name
   * BuddyPress:
     * Components:
       * Private Messaging: Enable
     * User Groups: Enable
   * Options:
     * Main settings > Pack > BuddyPress Legacy
     * Member Settings > Invitations > Allow registered members to invite people to join this network: check
     * Activity Settings > Post Comments:  Allow activity stream commenting on posts and comments: check
   * TODO describe additional fields wt sign up
 
4. **Fetch locally LudicrousDB from git**
* Clone repo by `git clone git@github.com:JoinUs4Health/ludicrousdb-ju4h.git` command or download zip `https://github.com/JoinUs4Health/ludicrousdb-ju4h/archive/refs/heads/master.zip`
* Copy content of `drop-in` folder to main plafrom folder
* Edit `wp-config.php` in main wordpress directory, COPY (for later purpouse) and remove first 39 lines, especially definitions:
```php
 define( 'DB_NAME', 'xxxx' );
 define( 'DB_USER', 'xxxx' );
 define( 'DB_PASSWORD', 'xxxx' );
 define( 'DB_HOST', 'xxxx' );
 define( 'DB_CHARSET', 'xxxx' );
 define( 'DB_COLLATE', 'xxxx' );
 ```
* Create second database and put to it two tables: `{prefix}_users` & `{prefix}_usermeta`.
* Edit `db-config.php` from main wordpress catalog. Edit this configurations and fill it with proper auth data. At `xxx_1` & `xxx_2` should be placed credentials database data like database host, user, database password and database name.
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
* After install ludicrousdb refresh page, all things should be working.

5. **Install joinus4health plugin**

   * Copy folder with plugin to `wp-content/plugins` 
   * Activate plugin in wordpress panel

6. **Setup menu & page**
   * Add pages:
     * Activation
     * Activity
     * Add new suggestion
     * Event catalog
     * Members
     * Privacy Policy
     * Report repository
     * Sign up
     * Working group
   * BuddyPress bind pages:
     * Pages > Directories:
       * Members > Members
       * Activity Stream > Activity
       * User Groups > Working group
       * Projects > Report Repository
     * Pages > Registration:
       * Register > Sign up
       * Activate -> Activation
   * Setup menu in this order:
     * Custom Links > Navigation Label: Topics; URL: `https://{website url}/ju4htopic/`
     * Custom Links > Navigation Label: Tasks; URL: `https://{website url}/ju4htask/`
     * Custom Links > Navigation Label: Suggestions; URL: `https://{website url}/ju4hsuggestion/`
     * Pages > Working group
     * Pages > Report repository
     * Pages > Event catalog
