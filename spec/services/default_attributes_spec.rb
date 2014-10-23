require 'spec_helper'

describe DefaultAttributes do
  describe 'it expects the new attributes to be the same as the old ones' do
    before do
      @primary_language = Language.where(slug: 'en').first
      @topbanner = TopBanner.make! title1: 'test title', text1: 'test text',
                                   title2: 'test title 2', text2: 'test text 2',
                                   language: @primary_language
      @new_topbanner = TopBanner.make language: Language.make!(slug: 'fr'),
                                      title1: '',
                                      title2: '',
                                      text1: '',
                                      text2: ''
      @new_topbanner = DefaultAttributes.new(@new_topbanner).set()
      @new_topbanner.save!
      @attributes =  @new_topbanner.attributes.reject { |k,v| ['id', 'created_at', 'updated_at', 'language_id'].include?(k) }
      @expected_attributes = @topbanner.attributes.reject { |k,v| ['id', 'created_at', 'updated_at', 'language_id'].include?(k) }
    end

    it { expect(@attributes).to eq @expected_attributes }
  end

  describe 'it should not set attributes that are already set' do
    before do
      @primary_language = Language.where(slug: 'en').first
      @topbanner = TopBanner.make! title1: 'test title', text1: 'test text',
                                   title2: 'test title 2', text2: 'test text 2',
                                   language: @primary_language
      @new_topbanner = TopBanner.make language: Language.make!(slug: 'fr'),
                                      title1: '',
                                      title2: '',
                                      text1: '',
                                      text2: 'some nice text'
      @new_topbanner = DefaultAttributes.new(@new_topbanner).set()
      @new_topbanner.save!
      @attributes =  @new_topbanner.attributes.reject { |k,v| ['id', 'created_at', 'updated_at', 'language_id'].include?(k) }
      @expected_attributes = @topbanner.attributes.reject { |k,v| ['id', 'created_at', 'updated_at', 'language_id'].include?(k) }
    end

    it 'expect the correct params' do
      expect(@attributes['title1']).to eq @expected_attributes['title1']
      expect(@attributes['text2']).to eq 'some nice text'
    end
  end
end
