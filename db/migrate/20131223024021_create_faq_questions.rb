class CreateFaqQuestions < ActiveRecord::Migration
  def change
    create_table :faq_questions do |t|
      t.text :question
      t.text :answer
      t.references :language, index: true

      t.timestamps
    end
  end
end
