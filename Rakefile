$: << "lib"
require 'rake_variables'

# DIY test framework
def assert(v)
  raise "Invalid assertion" unless v
end

def assert_undefined &block
  begin
    yield
  rescue Rake::UndefinedVariable
    true
  else
    raise "Invalid assertion"
  end
end

task :default => :test

# Set a top-level variable outside of a Task or NameSpace
Rake::Variable.set(:favorite, "everything")
assert(Rake::Variable.get(:favorite) == "everything")

Rake::Variable.set(:foo, "foo")

# Set a scoped variable
Rake::Variable.set("plants:favorite", "orchids")
assert(Rake::Variable.get("plants:favorite") == "orchids")

# Alternative way to set a scoped variable
Rake::Variable.set(:favorite, "mushrooms", [:fungus])
assert(Rake::Variable.get("fungus:favorite") == "mushrooms")

# Test that getting an unassigned variable raises an error
assert_undefined { Rake::Variable.get(:none_such) }

task :test => "animals:test" do |t| # Be sure you pass the Task as a block var
  # Read a variable set outside the task
  assert(t.get(:favorite) == "everything")
  
  # Test settings a top-level variable within a task
  t.set(:linnaeus, "liked Latin")
  assert(t.get(:linnaeus) == "liked Latin")
  puts "Success!"
end

namespace :animals do |ns| # Be sure to pass the NameSpace as a block var
  # Set a variable in a namespace
  ns.set(:favorite, "Animal from The Muppets")
  assert(ns.get(:favorite) == "Animal from The Muppets")
  # Test method_missing shorthand
  assert(ns.favorite == "Animal from The Muppets")
  
  task :test do |t|
    # Read a namespace var within a test
    assert(t.get(:favorite) == "Animal from The Muppets")
    assert(t.favorite == "Animal from The Muppets")
    # Find a var from a different namespace
    assert(t.get("plants:favorite") == "orchids")

    # Get a var from a higher namespace
    assert((t.get"^favorite") == "everything")
    assert(t.foo == "foo")
  end
end