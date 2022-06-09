# Deleting User Accounts on Request
This document describes the process of deleting personal user data on request.

## Process - Overview
1. User requests deletion.
1. UMG creates an Issue for S4P containing all information, what data must be deleted.
1. S4P deletes the data.

## Possible deletions
### Personal Data
- i.e. name, e-mail-address, nick-name, year of birth,…
- personal data *must* be deleted on request every time

### Content Data
- i.e. comments, ideas, topics,…
- *whether* and *which* content data are deleted must be decided by UMG

## Deleting the Data
To simplify the process of deleting data, the following scripts were created.


### Delete Personal Data
- to run this script you need to enter the user name in the second statement

```sql
-- set table prefix
SET @table_prefix := '5IDksda0';

-- get user id
SELECT @user_id := `ID`
    FROM CONCAT(@table_prefix, '_users')
    WHERE `user_login` = '[ENTER LOGIN NAME HERE]';

-- removes all personal data from SIGNUPS table
-- only deletes something, if the user registered several times with the same e-mail-address
DELETE FROM CONCAT(@table_prefix, '_signups')
    WHERE CONCAT(@table_prefix, '_signups').`user_email` = (SELECT `user_email`
        FROM CONCAT(@table_prefix, '_users')
        WHERE `ID` = @user_id);

-- removes all personal data from USERS table
-- status = 1 = spam
UPDATE CONCAT(@table_prefix, '_users')
    SET `user_login` = CONCAT('deleted_user_',@user_id)
        , `user_pass` = ''
        , `user_nicename` = CONCAT('deleted_user_',@user_id)
        , `user_email` = ''
        , `user_url` = ''
        , `user_activation_key` = ''
        , `user_status` = 1
        , `display_name` = CONCAT('deleted_user_',@user_id)
    WHERE `ID` = @user_id;

-- removes all personal data from USERMETA table
UPDATE CONCAT(@table_prefix, '_usermeta')
    SET `meta_value` = ''
    WHERE `user_id` = @user_id
        AND `meta_key` IN (`nickname`, `first_name`, `last_name`, `description`);
```
