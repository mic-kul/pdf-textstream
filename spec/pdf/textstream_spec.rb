require "spec_helper"

RSpec.describe Pdf::Textstream do
  let(:expected) { "dobe    PDF   is an ideal  format   for electronic" }

  it "has a version number" do
    expect(Pdf::Textstream::VERSION).not_to be nil
  end

  it "gets text out of pdf" do
    expect(Pdf::Textstream.file_path_to_text('./spec/fixtures/pdf-sample.pdf')).to include(expected)
  end
end
