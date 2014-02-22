require File.expand_path("../base", __FILE__)

class FileReader
  class CSV < Base
    def headers
      @headers ||= (csv.headers rescue nil) || []
    end

    def rows
      @rows ||= csv.each_with_object([]) do |row, array|
        array << (row.is_a?(::CSV::Row) ? row.to_hash.values : row)
      end
    end

    private
    def csv
      @csv ||= ::CSV.parse(reader.file.read, reader.options)
    end
  end
end
