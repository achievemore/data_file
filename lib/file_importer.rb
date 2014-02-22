require "file_reader"

class FileImporter
  attr_reader :reader

  def initialize(reader)
    @reader = reader
  end

  def each_row(row)
    if csv?
      row
    else
      row = reader.rows[row]
      defined?(POI) ? row.cells.map(&:value) : row.to_a
    end
  end

  def rows
    @rows ||= csv? ? reader.parser.rows : reader.parser.rows_range.to_a
  end

  def each(&block)
    rows.each do |row|
      row = each_row(row)
      if !row.all?(&:blank?) && row != reader.parser.headers
        block.call(row)
      end
    end
  end

  def csv?
    reader.parser.is_a?(FileReader::CSV)
  end
end
