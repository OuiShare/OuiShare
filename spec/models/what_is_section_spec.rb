require 'spec_helper'

describe WhatIsSection do
  before do
    @what_is_section = WhatIsSection.make!
  end

  it 'should be valid' do
    expect(@what_is_section).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of :title1 }
    it { should validate_presence_of :text1 }
    it { should validate_presence_of :title2 }
    it { should validate_presence_of :text2 }
    it { should validate_presence_of :title3 }
    it { should validate_presence_of :text3 }
    it { should validate_presence_of :title4 }
    it { should validate_presence_of :text4 }
  end

  describe 'associations' do
    subject { @what_is_section }
    it { should belong_to :language }
  end
end
