# encoding: utf-8

module DataFile
  class Reader
    attr_reader :file, :file_path, :options

    def initialize(file_path, options = {})
      @options = { headers: true }.merge(options) 
      @file_path = file_path
    end

    def file
      @file ||= File.open(file_path, 'r:iso-8859-1:utf-8')
    end

    def parser
      @parser ||= detector.text? ? CSV.new(self) : Excel.new(self)
    end

    def detector
      @detector ||= Detector.new(file)
    end
  end
end
