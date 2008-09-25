#!/usr/bin/env ruby
$: << "lib"
require 'rake_variables'

class TestRakeVariables < Test::Unit::TestCase
  
  def test_var_defined
    assert(Hash === Rake.application.vars)
  end
  
  def test_set
    set("my_var", "my_val")
    assert_equal("my_val", Rake.application.vars["my_var"])
  end

end
