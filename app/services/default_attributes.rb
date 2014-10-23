class DefaultAttributes
  def initialize(model)
    @model = model
  end

  def set(images = [])
    if @model.language.slug == 'en'
      return @model
    else
      english_obj = @model.class.where(language: Language.where(slug: 'en').first).first
      attributes = @model.attributes
      english_attributes = english_obj.attributes

      english_attributes.merge!('id' => nil)
      english_attributes.reject! { |k,v| images.include?(k) }
      attributes.reject! { |k,v| !v.present? }
      new_attributes = english_attributes.merge(attributes)

      images.each do |image_name|
        image_name = image_name.to_s
        new_attributes["remote_#{image_name}_url"] = english_attributes[image_name]
      end
    end
    @model.class.new(new_attributes)
  end
end
