require 'spec_helper'

describe Zion::Sentinel do
  describe '#get_data' do
    let(:obj) { described_class.new }

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
    end
  end
end
