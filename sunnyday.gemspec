$:.push File.expand_path('../lib', __FILE__)
require 'sunnyday/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY  
  s.name        = 'sunnyday'
  s.version     = SunnyDay::VERSION
  s.date        = '2013-10-19'
  s.summary     = 'Sunnyday is a wrapper around the OpenWeatherMap api (openweathermap.com)'
  s.description = 'The OpenWeatherMap service provides free weather data. This gem is a wrapper around the public api. Visit openweathermap.com for more details.'
  s.authors     = ['Heiko Dreyer']
  s.email       = 'heiko@boxedfolder.com'
  s.homepage    = 'http://github.com/bfolder/sunnyday'
  s.license       = 'MIT'
  
  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 1.8.7'
  s.add_dependency 'thor'
  s.add_dependency 'term-ansicolor'
end
