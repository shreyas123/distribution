require 'zip'
require 'csv'

module Zion
  class Sentinel < Zion::Source
    FILE_NAME = '/tmp/sentinels.zip'
    NODES = ['alpha', 'beta', 'gamma', 'delta', 'theta', 'lambda', 'tau', 'psi', 'omega']

    def self.perform
      new_obj = self.new
      data = new_obj.get_data
      new_obj.send_data(data)
    end

    def get_data
      data = hack_matrix({ source: 'sentinels' })
      File.write(FILE_NAME, data)
      parse_sentinal
    end

    def send_data(csv_data)
      #I have no clue how to read this data like honestly...
      csv_data.each do |data|
        next unless NODES.include?(data['node'])
        body = inform_zion({ source: 'sentinels', start_node: data['node'], end_node: data['node'],
                             start_time: Time.parse(data['time']).getlocal.strftime('%Y-%m-%dT%H:%M:%S'),
                             end_time: Time.parse(data['time']).getlocal.strftime('%Y-%m-%dT%H:%M:%S') })

        raise "Error" if body.code_type != Net::HTTPCreated
      end
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
        CSV.parse(csv_data, headers: true, header_converters: lambda {|f| f.strip}, converters: lambda {|f| f.strip })
      end
  end
end
