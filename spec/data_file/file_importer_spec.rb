require "spec_helper"
require "file_importer"

describe FileImporter do
  let(:object) { described_class.new reader }
  let(:reader) { double "reader" }
end
