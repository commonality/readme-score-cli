
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "readme/score/cli/version"

Gem::Specification.new do |spec|
  spec.name          = "readme-score-cli"
  spec.version       = Readme::Score::Cli::VERSION
  spec.authors       = ["Greg Swindle"]
  spec.email         = ["greg@swindle.net"]

  spec.summary       = %q{A CLI wrapper for the readme-score gem}
  spec.description   = %q{readme-score-cli creates a Terminal interface for the readme-score gem}
  spec.homepage      = "https://github.com/commonality/readme-score-cli#readme"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/commonality/readme-score-cli.git"
    spec.metadata["changelog_uri"] = "https://github.com/commonality/readme-score-cli/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "readme-score"
  spec.add_dependency "thor"

  spec.add_development_dependency "aruba"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "cucumber", "~>3.1"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
