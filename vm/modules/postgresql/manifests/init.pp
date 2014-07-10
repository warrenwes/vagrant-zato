class postgresql 
{


    package 
    { 
        "postgresql":
            ensure  => present,
    }

    package
    {
        "postgresql-client":
        ensure  => present
    }

    service 
    { 
        "postgresql":
            enable => true,
            ensure => running,
            require => Package["postgresql"]
    }
}
