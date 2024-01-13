require 'rails_helper'

RSpec.describe SearchTerm, type: :model do
  subject {SearchTerm.new(term: "what is your name", ip_address: "127.0.0.1") }

  before { subject.save }

  it 'term should be present' do
    subject.term = nil
    expect(subject).to_not be_valid
  end

  it 'term should be  present' do
    expect(subject).to be_valid
  end
end
