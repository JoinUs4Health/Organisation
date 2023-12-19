# Deleting User Accounts on Request
This document describes the process of deleting personal user data on request.

## Process - Overview
1. User request deletion of account by hovering over his nickname in right upper corner of website. In dropdown menu which appears, user clicks "Settings" option.
2. On page which appears for user in general tab "Settings", and sub tabs for this settings user should choose tab "Delete account" by clicking on it.
3. On page will appear box with information ```Deleting your account will delete all of your personal data associated with your account. It will be completely irrecoverable.``` and checkbox which user should check before deleting ```I understand the consequences.```.
4. On page user for proceed deleting account should check checkbox and click ```Delete Account```.
5. The page should reload and homepage should appear. During this time hook is invoked which anonymizes comment data. More about hook which was written for anonymizing data of comments is described in chapter: *Hook for anonymizing comments written by user*.

## Hook for anonymizig comments written by user
```php
function ju4h_deleted_user($user_id, $reassign, $user) {
    $comments = get_comments(array(
        'author__in' => $user_id
    ));
    $newname = 'anonymous'.time();
    foreach ($comments as $comment) {
        $update_comment = array();
        $update_comment['comment_author'] = $newname;
        $update_comment['comment_ID'] = $comment->comment_ID;
        $update_comment['comment_author_email'] = $newname.'@platform.joinus4health.eu';
        wp_update_comment($update_comment);
    }
}
add_filter('deleted_user', 'ju4h_deleted_user', 10, 3);
```
Hook written above gets all comments written by user which deletes his account. It generates comment author name *anonymous + time in format of unix timestamp* and comment e-mail *generatednamewithtimestamp@platform.joinus4health.eu*.
