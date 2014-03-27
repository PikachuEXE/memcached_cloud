require 'spec_helper'

describe "Memcachier" do
  let(:memcached_cloud_file) { File.join(File.dirname(__FILE__), '..', 'lib', 'memcached_cloud.rb') }
  [ "MEMCACHE_SERVERS", "MEMCACHE_USERNAME", "MEMCACHE_PASSWORD" ].each do |var|
    context var do
      let(:memcached_cloud_var) { var.gsub "MEMCACHE", "MEMCACHEDCLOUD" }
      before :each do
        ENV[var] = nil
        ENV[memcached_cloud_var] = nil
      end

      context 'when memcached_cloud env bar is not set'
      it "not set by default" do
        load memcached_cloud_file
        ENV[var].should be_nil
      end
      it "copied from memcached_cloud" do
        ENV[memcached_cloud_var] = "set"
        load memcached_cloud_file
        ENV[var].should == "set"
      end
      it "overwritten by memcached_cloud" do
        ENV[var] = "old"
        ENV[memcached_cloud_var] = "new"
        load memcached_cloud_file
        ENV[var].should == "new"
      end
      it "not removed by memcached_cloud" do
        ENV[var] = "old"
        load memcached_cloud_file
        ENV[var].should == "old"
      end
    end
  end
end
