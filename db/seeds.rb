#encoding: utf-8 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

newsletter = [
              {language: 'English', mailchimp_id: 'b9d2d97e53'},
              {language: "Français", mailchimp_id: 'de3e89d146'}
             ]

newsletter.each do |n|
  if NewsletterLanguage.find_by_language(n[:language]).nil?
    NewsletterLanguage.create(n)
  end
end

languages = [
              {name: 'English',  english_name: 'English', slug: 'en'},
              {name: 'Français', english_name: 'French', slug: 'fr'},
              {name: 'Deutsch',  english_name: 'German', slug: 'de'},
              {name: 'Español',  english_name: 'Spanish', slug: 'es'},
              {name: 'Italiano', english_name: 'Italian', slug: 'it'}
            ]

languages.each do |l|
  if Language.find_by_name(l[:name]).nil?
    Language.create(l)
  end
end
occupations = [
                {name: "Student"},
                {name: "Freelancer"},
                {name: "Startup"},
                {name: "Small Business"},
                {name: "Corporate"},
                {name: "Academia/Research"},
                {name: "Non-profit / NGO"},
                {name: "Other"}
              ]

occupations.each do |o|
  if Occupation.find_by_name(o[:name]).nil?
    Occupation.create(o)
  end
end
topics = [
                {name: "Collaborative Consumption"},
                {name: "Open Design & Manufacturing"},
                {name: "Open Knowledge & Education"},
                {name: "Peer-to-Peer Finance"},
                {name: "Open & Horizontal Governance"},
                {name: "Decentralized Tools & Open Source Software"},
                {name: "Community Building"}
              ]

topics.each do |o|
  if Topic.find_by_name(o[:name]).nil?
    Topic.create(o)
  end
end

user_sources = [
                  {name: "I attended a local event"},
                  {name: "I attended OuiShare Fest"},
                  {name: "I am a reader of the online magazine"},
                  {name: "I joined a OuiShare Facebook group"},
                  {name: "I read about it in the media"},
                  {name: "A friend told me about it"},
                  {name: "Other"}
               ]

user_sources.each do |s|
  if UserSource.find_by_name(s[:name]).nil?
    UserSource.create(s)
  end
end

sectors = [
            {name: "Real Estate"},
            {name: "Services"},
            {name: "Consumer Non-Durables"},
            {name: "Utilities"},
            {name: "IT Services"},
            {name: "Energy"},
            {name: "Electronics"},
            {name: "Chemicals"},
            {name: "Conglomerates"},
            {name: "Banking"},
            {name: "Transportation"},
            {name: "Communications"},
            {name: "Medical Facilities"},
            {name: "Consumer Goods"},
            {name: "Information Technology (IT)"},
            {name: "Technology"},
            {name: "Entertainment"},
            {name: "Consumer Durables"},
            {name: "Food and Beverage"},
            {name: "Software"},
            {name: "Clothing"},
            {name: "Insurance"},
            {name: "Investing"},
            {name: "Media"},
            {name: "Hardware"},
            {name: "Agriculture"},
            {name: "Industrial Goods"},
            {name: "Construction"},
            {name: "Financial"},
            {name: "Metals and Mining"},
            {name: "Drugs"},
            {name: "Capital Goods"},
            {name: "Basic Materials"},
            {name: "Healthcare"},
            {name: "Credit"},
            {name: "Other"}
          ]
sectors.each do |s|
  if Sector.find_by_name(s[:name]).nil?
    Sector.create(s)
  end
end