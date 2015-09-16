#!/bin/bash ../test_wrapper.sh

require_relative 'LibTestBase'

class BashTests < LibTestBase

  test 'bash exec command succeeds' do
    output,exit_status = Bash.new.exec('echo X')
    assert_equal 'X', output.strip
    assert_equal 0, exit_status
  end
  
  test 'bash exec command fails' do
    non_existent_command = 'eeeeeeeee'
    output,exit_status = Bash.new.exec(non_existent_command)
    assert output.include?(non_existent_command)
    refute_equal 0, exit_status
  end
    
end
