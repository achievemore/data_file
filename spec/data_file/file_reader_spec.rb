require "spec_helper"
require "file_reader"

describe FileReader do
  let(:object) { described_class.new "file_path" }

  describe "#parser" do
    subject { object.parser }

    context "when the file is text" do
      before { object.stub_chain(:detector, :text?).and_return(true) }
      it { should be_kind_of FileReader::CSV }
    end

    context "when the file is a spreadsheet" do
      before { object.stub_chain(:detector, :text?).and_return(false) }
      it { should be_kind_of FileReader::Excel }
    end
  end

  describe "#detector" do
    let(:file) { double "file" }
    before { object.stub(:file).and_return(file) }
    subject { object.detector }

    it { should be_kind_of(FileDetector) }
    its(:file) { should == file }
  end
end
