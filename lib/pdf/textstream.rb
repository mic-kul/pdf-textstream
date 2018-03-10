require "pdf/textstream/version"
require "java"

# load jars
require_relative "../../jars/pdfbox-2.0.6.jar"
require_relative "../../jars/commons-logging-1.2.jar"
require_relative "../../jars/fontbox-2.0.6.jar"

$CLASSPATH << "#{File.expand_path(File.dirname(__FILE__))}/../../classes"
module Pdf
  module Textstream
    PDFLayoutTextStripper = JavaUtilities.get_proxy_class("PDFLayoutTextStripper")

    # change namespace
    PDFParser = Java::OrgApachePdfboxPdfparser::PDFParser
    RandomAccessFile = Java::OrgApachePdfboxIo::RandomAccessFile
    PDDocument = Java::OrgApachePdfboxPdmodel::PDDocument
    PDFTextStripper = Java::OrgApachePdfboxText::PDFTextStripper

    def self.file_path_to_text(path)
      # TODO: exception handling
      pdfParser = PDFParser.new(RandomAccessFile.new(Java::JavaIo::File.new(path), "r"))
      pdfParser.parse()
      pdDocument = PDDocument.new(pdfParser.getDocument());
      pdfTextStripper = PDFLayoutTextStripper.new
      string = pdfTextStripper.getText(pdDocument);
      return string
    end
  end
end
