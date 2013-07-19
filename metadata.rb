name              'healthcheck'
maintainer        'Kief Morris'
maintainer_email  'chef@kief.com'
license           'MIT'
description       'Sets node attributes to describe monitoring checks'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
minor_ver = `git log -n 1 --pretty=format:'%at' #{File.dirname(__FILE__)} 2> /dev/null`
version           '0.2.' + (minor_ver != '' ? minor_ver : '0')
