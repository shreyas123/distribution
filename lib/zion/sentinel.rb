require 'zip'
require 'csv'

module Zion
  class Sentinel < Zion::Source
    FILE_NAME = '/tmp/sentinels.zip'

    def get_data
      data = hack_matrix({ source: 'sentinels' })
      File.write(FILE_NAME, data)
      parse_sentinal
    end

    private
      def parse_sentinal
        csv = ''
        Zip::File.open(FILE_NAME) do |zip_file|
          csv = zip_file.read('sentinels/routes.csv')
        end
        parse_csv(csv.gsub('"', ''))
      end

      def parse_csv(csv_data)
        CSV.parse(csv_data, headers: true, quote_char: '"', force_quotes: true)
      end
  end
end