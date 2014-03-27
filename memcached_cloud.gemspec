lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "memcached_cloud/version"

Gem::Specification.new do |spec|
  spec.name        = "memcached_cloud"
  spec.version     = MemcachedCloud::VERSION
  spec.summary     = "Compatibility gem for using memcached libraries with Memcached Cloud"
  spec.description = "Simple gem that sets the memcached environment variables to the values of corresponding Memcached Cloud environment variables.
                   This makes it seemless to use Memcached Cloud in environments like Heroku using the Dalli or other compatible memcached gem."
  spec.authors     = ["PikachuEXE"]
  spec.email       = "pikachuexe@gmail.com"
  spec.homepage    = "http://github.com/PikachuEXE/memcached_cloud"
  spec.license     = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.1.0" # MRI 1.8
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "gem-release", ">= 0.7"
end
