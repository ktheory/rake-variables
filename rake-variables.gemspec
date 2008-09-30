Gem::Specification.new do |s|
  s.name     = "rake-variables"
  s.version  = "0.3"
  s.date     = "2008-09-30"
  s.summary  = "Get and set namespaced variables in rake tasks"
  s.email    = "aaron@ktheory.com"
  s.homepage = "http://github.com/ktheory/rake-variables"
  s.description = "Rake Variables extends Rake::NameSpace and Rake::Task to get and set namespaced variables. See Rakefile for examples."
  s.has_rdoc = false
  s.authors  = ["Aaron Suggs"]
  s.files    = %w(History.txt README.txt TODO.txt CHANGELOG.txt Rakefile lib/rake_variables.rb)
  s.test_files = []
  # s.rdoc_options = ["--main", "README.txt"]
  # s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.add_dependency("rake", ["> 0.0.0"])
end
