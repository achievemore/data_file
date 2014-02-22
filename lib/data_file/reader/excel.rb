begin
  require "poi"
rescue LoadError
  require "spreadsheet"
end

module DataFile
  class Reader
    class Excel < Base
      def headers
        defined?(POI) ? rows[0].cells.map(&:value) : rows[0].to_a
      end

      def rows
        worksheet.rows
      end

      def rows_range
        (rows_index..rows.size)
      end

      def rows_index
        reader.options[:headers] ? 1 : 0
      end

      def operator
        defined?(POI) ? POI::Workbook : Spreadsheet
      end

      private
      def excel
        operator.open(reader.file_path)
      end

      def worksheet
        excel.worksheets.first
      end
    end
  end
end
