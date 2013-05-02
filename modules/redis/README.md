# Puppet Module for Redis with Magento Support

## Repository

The repository must be included by itself

    stage { 'apt': }
    Stage['apt'] -> Stage['main']

    class { 'apt':
      stage => apt,
    }
    class { 'redis::apt':
      stage => apt,
    }

then, to use the magento class (dev config)

    class { 'redis::magento':
      maxmemory_cache   => 64mb,
      maxmemory_fpc     => 64mb,
      maxmemory_session => 16mb,
    }
