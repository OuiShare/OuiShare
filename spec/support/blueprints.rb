require 'machinist/active_record'

# Add your blueprints here.

User.blueprint do
  name {'Some nice guy'}
  email {"someniceguy#{sn}@gmail.com"}
  password {'niceguy123'}
  password_confirmation {'niceguy123'}
end

Authorization.blueprint do
  user {User.make!}
  provider {"facebook"}
  uid {10000}
end

Language.blueprint do
  name {'English'}
  english_name {'English'}
  slug {'en'}
  visible {false}
end

TopBanner.blueprint do
  title1 {'Placeholder title 1'}
  text1 {'Placeholder lorem ipsum dolor sit amet 1'}
  title2 {'Placeholder title 2'}
  text2 {'Placeholder lorem ipsum dolor sit amet 2'}
  language {Language.make!}
end

WhatIsSection.blueprint do
  mission {'To conquer the world'}
  values {'One, two, three, four'}
  history {'Once uppon a time...'}
  past_projects {'OuiShare Fest, and more!'}
  language {Language.make!}
end
