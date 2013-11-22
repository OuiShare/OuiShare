require 'spec_helper'

describe TopBanner do
  before do
    @top_banner = TopBanner.make!
  end

  it 'should be valid' do
    expect(@top_banner).to be_valid
  end

  describe 'associations' do
    subject { @top_banner }
    it { should belong_to :language }
  end

  describe 'validations' do
    it { should validate_presence_of :title1 }
    it { should validate_presence_of :text1 }
    it { should validate_presence_of :title2 }
    it { should validate_presence_of :text2 }
  end
end
