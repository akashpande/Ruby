Gem::Specification.new do |s|
  s.name        = "inventory_assignment"
  s.version     = "1.0.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Akash Pande"]
  s.email       = ["akashpande3129@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A sample gem}
  s.description = %q{A sample gem. It doesn't do a whole lot, but it's still useful.}

  s.add_runtime_dependency "launchy"
  s.add_development_dependency "rspec", "~>2.5.0"

  s.files         = ["lib/Inventory_Assignment.rb"]
  s.executables   = 'Inventory_Assignment'
  s.require_paths = ["lib"]
end
