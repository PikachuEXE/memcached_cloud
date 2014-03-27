require 'memcached_cloud/version'

module MemcachedCloud
  extend self

  def setup
    {
      "MEMCACHEDCLOUD_SERVERS" => "MEMCACHE_SERVERS",
      "MEMCACHEDCLOUD_USERNAME" => "MEMCACHE_USERNAME",
      "MEMCACHEDCLOUD_PASSWORD" => "MEMCACHE_PASSWORD",
    }.each do |key, value|
      ENV[value] = ENV[key] if ENV[key]
    end
  end
end

MemcachedCloud.setup
