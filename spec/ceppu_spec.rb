require 'ceppu/event'
require 'classy_hash'
require 'spec_helper'

RSpec.describe Ceppu::Event do
  let!(:schema) do
    {
      event_id: String,
      level: String,
      message: String,
      timestamp: String,
      type: String,
      value: String,
      stacktrace: Hash
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

  it 'should send event' do
    described_class.sample
  rescue StandardError => e
    stub = stub_request(
      :post,
      'http://localhost:6969'
    ).to_return(
      status: 200,
      body: '{"message":true}',
      headers: {
        'Content-Type' => 'application/json'
      }
    )
    response = described_class.create_event(e)
    expect(stub).to have_been_requested
    expect(response.code).to eq('200')
    expect(response.body).to eq('{"message":true}')
  end
end
