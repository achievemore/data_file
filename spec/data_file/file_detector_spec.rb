require "spec_helper"
require "file_detector"

describe FileDetector do
  let(:object) { described_class.new(file_path) }
  let(:path) { "../../support/fixtures/files/#{file}" }
  let(:file_path) { File.open(File.expand_path(path, __FILE__)) }

  describe "#text?" do
    subject { object.text? }

    context "when the file is a xls" do
      let(:file) { "test.xls" }
      it { should be_false }
    end

    context "when the file is a xlsx" do
      let(:file) { "test.xlsx" }
      it { should be_false }
    end

    context "when the file is a txt" do
      let(:file) { "test.txt" }
      it { should be_true }
    end

    context "when the file is a csv" do
      let(:file) { "test.csv" }
      it { should be_true }
    end
  end
end
