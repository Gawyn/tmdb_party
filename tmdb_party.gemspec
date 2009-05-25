# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tmdb_party}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Duff"]
  s.date = %q{2009-05-24}
  s.email = %q{duff.john@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "lib/tmdb_party.rb",
    "lib/tmdb_party/attributes.rb",
    "lib/tmdb_party/category.rb",
    "lib/tmdb_party/core_extensions.rb",
    "lib/tmdb_party/image.rb",
    "lib/tmdb_party/movie.rb",
    "lib/tmdb_party/video.rb",
    "test/fixtures/search.xml",
    "test/fixtures/transformers.xml",
    "test/test_helper.rb",
    "test/tmdb_party/test_tmdb_party.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jduff/tmdb_party}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.test_files = [
    "test/test_helper.rb",
    "test/tmdb_party/test_tmdb_party.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0.4.3"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
      s.add_development_dependency(%q<context>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0.4.3"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
      s.add_dependency(%q<context>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0.4.3"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
    s.add_dependency(%q<context>, [">= 0"])
  end
end
