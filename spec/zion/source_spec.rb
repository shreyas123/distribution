require 'spec_helper'

describe Zion::Source do
  describe '#hack_matrix' do
    it 'makes a get request' do
      uri = URI.parse(Zion::Source::GET_URL)
      uri.query = URI.encode_www_form( { passphrase: Zion::Source::PASSPHRASE } )
      expect(Net::HTTP).to receive(:get).with(uri).and_return ''
      described_class.new.hack_matrix
    end
  end

  describe '#inform_zion' do
    it 'makes a post request' do
      uri = URI.parse(Zion::Source::POST_URL)
      expect(Net::HTTP).to receive(:post_form).with(uri, { passphrase: Zion::Source::PASSPHRASE }).and_return true
      described_class.new.inform_zion
    end
  end
end
