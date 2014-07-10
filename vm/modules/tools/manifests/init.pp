class tools {
    $packages = ['curl', 'build-essential','apt-transport-https','python-software-properties', 'software-properties-common']
    
    package { $packages:
        ensure => installed,
    }
}
