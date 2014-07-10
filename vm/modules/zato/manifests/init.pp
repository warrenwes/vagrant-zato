class zato::package {

exec { 'zato_repo':
    command => '/usr/bin/add-apt-repository https://zato.io/repo/stable/ubuntu',
}
exec { 'import-key':
    path => '/bin:/usr/bin',
    command => 'curl -s https://zato.io/repo/zato-0CBD7F72.pgp.asc | sudo apt-key add -',
    unless => "apt-key list | grep 'zato'",
}
exec { 'update apt':
    command => '/usr/bin/apt-get update',
    require => [
    	Exec['zato_repo'],
	Exec['import-key'],
    ],
}



package { 'zato':
        ensure => latest,
        require => Exec['update apt'],
    }
}

class zato {
    include zato::package
}
