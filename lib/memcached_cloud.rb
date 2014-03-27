require 'memcached_cloud/version'

module MemcachedCloud
  MEMCACHEDCLOUD_TO_MEMCACHE_ENV_VAR_MAPPINGS ||= {
    "MEMCACHEDCLOUD_SERVERS" => "MEMCACHE_SERVERS",
    "MEMCACHEDCLOUD_USERNAME" => "MEMCACHE_USERNAME",
    "MEMCACHEDCLOUD_PASSWORD" => "MEMCACHE_PASSWORD",
  }.freeze

  extend self

  def setup
    MEMCACHEDCLOUD_TO_MEMCACHE_ENV_VAR_MAPPINGS.each do |key, value|
      ENV[value] = ENV[key] if ENV[key]
    end
  end
end

MemcachedCloud.setup
