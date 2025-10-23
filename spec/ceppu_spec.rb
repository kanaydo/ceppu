require 'ceppu'
require 'classy_hash'

RSpec.describe Ceppu do
  let!(:schema) do
    {
      event_id: String,
      level: String,
      message: String,
      timestamp: String,
      exception: Hash
    }
  end

  it 'should throw error' do
    expect do
      described_class.sample
    end.to raise_error(StandardError)
  end

  it 'should return \'Sample Error\' message' do
    described_class.sample
  rescue StandardError => e
    expect(e.message).to eq('Sample Error')
  end

  it 'should parse the exeption' do
    described_class.sample
  rescue StandardError => e
    parsed = described_class.parse_exeption(e)
    expect(ClassyHash.validate(parsed, schema)).to be true
  end
end
