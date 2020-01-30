<?php
Define('DB_HOST', getenv("MYSQL_HOST"));
Define('DB_PORT', getenv("MYSQL_PORT"));
Define('DB_NAME', getenv("MYSQL_DATABASE"));
Define('DB_USER', getenv("MYSQL_USER"));
Define('DB_PASSWORD', getenv("MYSQL_PASSWORD"));

Define('DIR_TEMPLATES', "./templates/");
Define('DIR_MODULES', "./modules/");
Define('DEBUG_MODE', 1);
Define('UPDATES_REPOSITORY_NAME', 'smarthome');

Define('PROJECT_TITLE', getenv("MJDM_TITLE"));
Define('PROJECT_BUGTRACK', "bugtrack@smartliving.ru");

date_default_timezone_set('UTC');

if (isset($_ENV["COMPUTERNAME"]) && $_ENV["COMPUTERNAME"]) {
    Define('COMPUTER_NAME', strtolower($_ENV["COMPUTERNAME"]));
} else {
    Define('COMPUTER_NAME', 'mycomp');
}

Define('DOC_ROOT', dirname(__FILE__));

Define('SERVER_ROOT', '/var/www');
Define('PATH_TO_PHP', 'php');
Define('PATH_TO_MYSQLDUMP', "mysqldump");

if (isset($_ENV["S2G_BASE_URL"]) && $_ENV["S2G_BASE_URL"]) {
    Define('BASE_URL', $_ENV["S2G_BASE_URL"]);
} else {
    Define('BASE_URL', getenv("MJDM_BASE_URL"));
}

Define('ROOT', DOC_ROOT."/");
Define('ROOTHTML', "/");
Define('PROJECT_DOMAIN', isset($_SERVER['SERVER_NAME']) ? $_SERVER['SERVER_NAME'] : php_uname("n"));

// 1-wire OWFS server
//Define('ONEWIRE_SERVER', 'tcp://localhost:8234');

//Define('HOME_NETWORK', '192.168.0.*');
//Define('EXT_ACCESS_USERNAME', 'user');
//Define('EXT_ACCESS_PASSWORD', 'password');

// (Optional)
//Define('DROPBOX_SHOPPING_LIST', 'c:/data/dropbox/list.txt');

$restart_threads = array('cycle_execs.php',
                         'cycle_main.php',
                         'cycle_ping.php',
                         'cycle_scheduler.php',
                         'cycle_states.php',
                         'cycle_webvars.php');

//Define('USE_PROXY', '127.0.0.1:8888');               //PROXY SERVER DETAILS (optional)
//Define('USE_PROXY_AUTH', 'user:password');           //PROXY SERVER AUTH (optional)

//Define('HISTORY_NO_OPTIMIZE', 1);

Define('MASTER_UPDATE_URL', 'https://github.com/sergejey/majordomo/archive/master.tar.gz');

//Define('WAIT_FOR_MAIN_CYCLE', 1);
//Define('TRACK_DATA_CHANGES', 1);
//Define('TRACK_DATA_CHANGES_IGNORE', 'cycle_, clockchime, uptime, WSClientsTotal');

Define('GETURL_WARNING_TIMEOUT', 5);

//Define('SEPARATE_HISTORY_STORAGE',1);
//Define('LOG_DIRECTORY', 'c:/temp');
//Define('LOG_MAX_SIZE', 2);
//Define('PATH_TO_FFMPEG','avconv');
//Define('DISABLE_PANEL_ACCELERATION', 1);
//Define('VERBOSE_LOG',1);
//Define('VERBOSE_LOG_IGNORE','.checkstate, ThisComputer.uptime');
//Define('DISABLE_SIMPLE_DEVICES',1);

