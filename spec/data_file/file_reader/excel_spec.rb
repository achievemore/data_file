require "spec_helper"
require "file_reader"

describe FileReader::Excel do
  let(:xls_file) do
    File.open(File.expand_path("../../../support/fixtures/files/test.xls", __FILE__))
  end

  let(:object) { described_class.new reader }
  let(:reader) { FileReader.new xls_file, options }
  let(:options) { { } }

  describe "#rows" do
    subject { object.rows }

    if defined?(POI)
      it { should be_kind_of POI::Rows }
    else
      its(:first) { should be_kind_of Spreadsheet::Excel::Row }
    end
  end

  describe "#rows_range" do
    subject { object.rows_range }

    context "when the headers option is true" do
      let(:options) { { headers: true } }
      it { should == (1..45) }
    end

    context "when the headers option is false" do
      let(:options) { { headers: false } }
      it { should == (0..45) }
    end

    context "when the headers option is not defined" do
      let(:options) { { } }
      it { should == (1..45) }
    end
  end

  describe "#rows_index" do
    subject { object.rows_index }

    context "when the headers option is true" do
      let(:options) { { headers: true } }
      it { should == 1 }
    end

    context "when the headers option is false" do
      let(:options) { { headers: false } }
      it { should == 0 }
    end

    context "when the headers option is not defined" do
      let(:options) { { } }
      it { should == 1 }
    end
  end
end
