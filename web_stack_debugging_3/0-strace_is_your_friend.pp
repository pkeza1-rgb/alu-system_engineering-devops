# Fix Apache 500 error: WordPress tries to load a file with a typo'd
# extension (.phpp instead of .php) in wp-settings.php
exec { 'fix-wordpress':
  command => 'sed -i "s/phpp/php/g" /var/www/html/wp-settings.php',
  path    => ['/bin', '/usr/bin', '/usr/local/bin'],
  onlyif  => 'grep -q "phpp" /var/www/html/wp-settings.php',
}
