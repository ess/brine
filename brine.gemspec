# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','brine','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'brine'
  s.version = Brine::VERSION
  s.author = 'Dennis Walters'
  s.email = 'dwalters@engineyard.com'
  s.homepage = 'https://github.com/ess/brine'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Sync between Github Issues and your cukes'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','brine.rdoc']
  s.rdoc_options << '--title' << 'brine' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'brine'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba', '~> 0.6.2')
  s.add_development_dependency('rspec', '~> 3.2.0')
  s.add_development_dependency('webmock', '~> 1.21.0')
  s.add_development_dependency('vcr', '~> 2.9.3')
  s.add_runtime_dependency('gli','~> 2.13.1')
  s.add_runtime_dependency('github_api', '~> 0.12.3')
  s.add_runtime_dependency('terminal-table', '~> 1.4.5')
end
