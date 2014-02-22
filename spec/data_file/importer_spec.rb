require "spec_helper"
require "data_file/importer"

module DataFile
  describe Importer do
    let(:object) { described_class.new reader }
    let(:reader) { double "reader" }
  end
end
