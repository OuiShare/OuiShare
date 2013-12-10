require 'spec_helper'

describe Language do
  before do
    @language = Language.make!
  end

  it 'should be valid' do
    expect(@language).to be_valid
  end

  describe 'validations' do
    subject { @language }

    it { should validate_presence_of :name }
    it { should validate_presence_of :english_name }
    it { should validate_presence_of :slug }
  end

  describe 'associations' do
    it { should have_one :top_banner }
    it { should have_one :what_is_section }
  end
end
