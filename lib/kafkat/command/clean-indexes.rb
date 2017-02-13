module Kafkat
  module Command
    class CleanIndexes < Base
      register_as 'clean-indexes'

      usage 'clean-indexes',
            'Delete untruncated Kafka log indexes from the filesystem.'

      def run
        print "This operation will remove any untruncated index files.\n"

        begin
          print "\nStarted.\n"
          count = kafka_logs.clean_indexes!
          print "\nDone (#{count} index file(s) removed).\n"
        rescue Interface::KafkaLogs::NoLogsError => e
          print "ERROR: Kakfa log directory doesn't exist.\n"
          exit 1
        rescue Interface::KafkaLogs::KafkaRunningError => e
          print "ERROR: Kafka is still running.\n"
          exit 1
        rescue => e
          print "ERROR: #{e}\n"
          exit 1
        end
      end
    end
  end
end
