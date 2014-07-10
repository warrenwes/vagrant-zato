stage { 'first':
    before => Stage['second'],
}

stage { 'second':
    before => Stage['third'],
}

stage { 'third':
    before => Stage['main']
}

class { "apt_get::update":
    stage  => first,
}

class { 'tools':
    stage => second,
}

class { 'zato':
    stage => main,
}
include apt_get::update
include tools
include git
include vim
include redis
include postgresql
include zato


