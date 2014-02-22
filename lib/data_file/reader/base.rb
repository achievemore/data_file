module DataFile
  class Reader
    class Base
      attr_reader :reader

      def initialize(reader)
        @reader = reader
      end
    end
  end
end
