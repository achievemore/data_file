class FileReader
  class Base
    attr_reader :reader

    def initialize(reader)
      @reader = reader
    end
  end
end
