module Kafkat
  module CommandIO
    def prompt_and_execute_assignments(assignments)
      print "This operation executes the following assignments:\n\n"
      print_assignment_header
      assignments.each { |a| print_assignment(a) }
      print "\n"

      result = nil
      begin
        print "\nBeginning.\n"
        result = admin.reassign!(assignments)
        print "Started.\n"
      rescue Interface::Admin::ExecutionFailedError
        print result
      end
    end
  end
end
