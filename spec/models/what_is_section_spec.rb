require 'spec_helper'

describe WhatIsSection do
  before do
    @what_is_section = WhatIsSection.make!
  end

  it 'should be valid' do
    expect(@what_is_section).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of :mission }
    it { should validate_presence_of :values }
    it { should validate_presence_of :history }
    it { should validate_presence_of :past_projects }
  end

  describe 'associations' do
    subject { @what_is_section }
    it { should belong_to :language }
  end
end
