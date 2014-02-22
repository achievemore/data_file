require "mime-types"

module DataFile
  class Detector
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def text?
      mime_type =~ /text\/(plain|csv|comma-separated-values)/
    end

    def encoding
      file.external_encoding.name
    end

    def mime_type
      MIME::Types.type_for(file.path).first.content_type
    end
  end
end
