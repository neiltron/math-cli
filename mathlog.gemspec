# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','mathlog','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'mathlog'
  s.version = Mathlog::VERSION
  s.author = 'Neil Pullman'
  s.email = 'neil@descend.org'
  s.homepage = 'http://github.com/neiltron'
  s.platform = Gem::Platform::RUBY
  s.summary = 'CLI client for mathematics.io'
# Add your other files here if you make them
  s.files = %w(
bin/mathlog
lib/mathlog/version.rb
lib/mathlog.rb
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','mathlog.rdoc']
  s.rdoc_options << '--title' << 'mathlog' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'mathlog'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.7.0')
  s.add_dependency('httparty')
end
