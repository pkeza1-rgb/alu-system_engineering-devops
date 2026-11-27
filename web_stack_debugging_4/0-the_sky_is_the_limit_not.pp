# Raises the open file limit (ULIMIT) for Nginx so it can handle high concurrency, then restarts Nginx
exec { 'fix--for-nginx':
  command => 'sed -i "s/-n 15/-n 4096/" /etc/default/nginx',
  path    => ['/bin', '/usr/bin', '/usr/local/bin'],
  onlyif  => 'grep -q -e "-n 15" /etc/default/nginx',
  notify  => Exec['restart-nginx'],
}

exec { 'restart-nginx':
  command     => '/etc/init.d/nginx restart',
  path        => ['/bin', '/usr/bin', '/usr/local/bin', '/etc/init.d'],
  refreshonly => true,
}
