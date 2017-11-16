module Decidim
  module Censuses
    class CsvData

      attr_reader :errors, :values

      def initialize(file)
        @file = file
        @errors = []
        @values = []

        CSV.foreach(@file, headers: true, col_sep: ';') do |row|
          process_row(row)
        end
      end

      private

      def process_row(row)
        id_document = Decidim::Censuses::Census.to_id_document(row[0])
        date = Decidim::Censuses::Census.to_birthdate(row[1])
        if id_document.present? && !date.nil?
          values << [id_document, date]
        else
          errors << row
        end
      end

    end
  end
end
