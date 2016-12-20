require 'spec_helper'

describe Zion::Sentinel do
  describe '#get_data' do
    let(:obj) { described_class.new }

    it 'makes a get request to get the CSV data' do
      expect(obj).to receive(:hack_matrix).with({source: 'sentinels'}).and_return ''
      obj.get_data
    end
  end
end
