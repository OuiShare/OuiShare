#encoding: utf-8 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

NewsletterLanguage.create([{language: 'English', mailchimp_id: 'b9d2d97e53'}, {language: "Français", mailchimp_id: 'de3e89d146'}])

Language.create([{name: 'English',  english_name: 'English'},
                 {name: 'Français', english_name: 'French'},
                 {name: 'Deutsch',  english_name: 'German'},
                 {name: 'Español',  english_name: 'Spanish'}])
