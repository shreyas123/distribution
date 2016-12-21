require 'spec_helper'

describe Zion::Sentinel do
  describe '#get_data' do
    let(:obj) { described_class.new }

    before do
      zip_file = double('zip_file')
      allow(Zip::File).to receive(:open).and_yield zip_file
      allow(zip_file).to receive(:read).with('sentinels/routes.csv').and_return 'a,b,c\n1,2,3'
    end

    it 'makes a get request to get the CSV data' do
      expect(obj).to receive(:hack_matrix).with({source: 'sentinels'}).and_return ''
      obj.get_data
    end

    context 'when data is not expected but allowed' do
      before do
        allow(obj).to receive(:hack_matrix).with({source: 'sentinels'}).and_return 'tmpdata'
      end

      it 'writes the data to the tmp zip file' do
        expect(File).to receive(:write).with(described_class::FILE_NAME, 'tmpdata').and_return true
        obj.get_data
      end

      it 'reads the zip file and returns CSV' do
        zip_file = double('zip_file')
        expect(Zip::File).to receive(:open).and_yield zip_file
        expect(zip_file).to receive(:read).with('sentinels/routes.csv').and_return 'a,b,c\n1,2,3'
        obj.get_data
      end
    end
  end

  describe '#send_data' do
    let(:obj) { described_class.new }
    subject { obj.send_data(data) }
    let(:data) { [{'node' => 'alpha', 'time' => '2030-12-31T22:00:01+09:00'}] }

    it 'informs Zion about the data' do
      http = double('hhtp', code_type: Net::HTTPCreated)
      expect(obj).to receive(:inform_zion).with({ source: 'sentinels', start_node: 'alpha', end_node: 'alpha',
                                                 start_time: '2030-12-31T14:00:01',
                                                 end_time: '2030-12-31T14:00:01' }).and_return http
      subject
    end
  end
end
