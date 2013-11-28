module Translatable
  def self.included(k)
    k.scope :by_language, ->(language) { k.where('language_id = ?', Language.where(slug: language.to_s)) }
  end
end
