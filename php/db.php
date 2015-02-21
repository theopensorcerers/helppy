<?php
/**
* Opens a connection to the database
*/

error_reporting(E_ALL);

require_once 'defines.php';

$db = mysqli_init();
if (!$db) {
    die('db_init failed');
}

if (!$db->options(MYSQLI_INIT_COMMAND, 'SET AUTOCOMMIT = 0')) {
    die('Setting MYSQLI_INIT_COMMAND failed');
}

if (!$db->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5)) {
    die('Setting MYSQLI_OPT_CONNECT_TIMEOUT failed');
}

if (!$db->real_connect($db_hostmame, $db_username, $db_password, $db_dbase)) {
    die('Connect Error (' . db_connect_errno() . ') '
            . db_connect_error());
}

?>