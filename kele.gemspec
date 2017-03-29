Gem::Specification.new do |s|
  s.name = 'kele'
  s.version = '0.0.1'
  s.date = '2017-03-27'
  s.summary = 'Kele API Client'
  s.description = 'A client for the Bloc API'
  s.authors = ['Brandon Baker']
  s.email = 'brbaker400@gmail.com'
  s.files = ['lib/kele.rb']
  s.require_paths = ["lib"]
  s.homepage = 'https://rubygems.org/gems/kele'
  s.license = 'MIT'
  # # # httparty provides a programmatic Ruby interface to make HTTP requests
  s.add_runtime_dependency 'httparty', '~> 0.13'
end
