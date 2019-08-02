# frozen_string_literal: true

require File.join File.expand_path('lib', __dir__), 'foreman_hostgroup_ipmi/version'

Gem::Specification.new do |spec|
  spec.name          = "foreman_hostgroup_ipmi"
  spec.version       = ForemanHostgroupIpmi::VERSION
  spec.authors       = ["Alexander Olofsson"]
  spec.email         = ["alexander.olofsson@liu.se"]

  spec.summary       = 'Adds IPMI configuration to hostgroups in Foreman.'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/ananace/foreman_hostgroup_ipmi'
  spec.license       = 'GPL-3.0'

  spec.files         = Dir['{app,config,db,lib}/**/*'] + ['LICENSE', 'Rakefile', 'README.md']
  spec.test_files    = Dir['test/**/*']

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rdoc'
  spec.add_development_dependency 'rubocop', '0.54.0'
end
