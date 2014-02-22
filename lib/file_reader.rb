# encoding: utf-8
require "file_detector"
require "csv"
require File.expand_path("../file_reader/csv", __FILE__)
require File.expand_path("../file_reader/excel", __FILE__)

class FileReader
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
    @detector ||= FileDetector.new(file)
  end
end
