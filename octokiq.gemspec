require_relative 'lib/octokiq/version'

Gem::Specification.new do |spec|
  spec.name          = 'octokiq'
  spec.version       = Octokiq::VERSION
  spec.authors       = ['Bran Liang']
  spec.email         = ['bran@corran.cn']

  spec.summary       = 'Next generation background processing for ruby'
  spec.description   = 'Ractor based worker system.'
  spec.homepage      = 'https://github.com/BranLiang/octokiq'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.0.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/BranLiang/octokiq'
  spec.metadata['changelog_uri'] = 'https://github.com/BranLiang/octokiq/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|examples)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_runtime_dependency('redis', '~> 4.2')
end
