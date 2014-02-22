require "spec_helper"

module DataFile
  describe Reader::CSV do
    let(:csv_file) do
      File.open(File.expand_path("../../../support/fixtures/test.csv", __FILE__))
    end
    let(:txt_file) do
      File.open(File.expand_path("../../../support/fixtures/test.txt", __FILE__))
    end

    let(:file) { csv_file }
    let(:object) { described_class.new reader }
    let(:reader) { Reader.new file, options }
    let(:options) { { } }

    describe "#rows" do
      subject { object.rows }

      context "when the headers option is true" do
        let(:options) { { headers: true } }

        it { should == [ ["Does", "It", "Work", "?"] ] }
      end

      context "when the headers option is false" do
        let(:options) { { headers: false } }

        it { should == [ ["This", "Is", "A", "Test"],
                         ["Does", "It", "Work", "?"] ] }
      end

      context "when the headers option is not defined" do
        it { should == [ ["Does", "It", "Work", "?"] ] }
      end
    end

    describe "#headers" do
      subject { object.headers }
      it { should == ["This", "Is", "A", "Test"] }
    end
  end
end
