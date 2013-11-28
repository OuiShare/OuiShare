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
  title1 {'Mission'}
  text1 {'To conquer the world'}
  title2 {'Values'}
  text2 {'One, two, three, four'}
  title3 {'history'}
  text3 {'Once uppon a time...'}
  title4 {'Past Projects'}
  text4 {'OuiShare Fest, and more!'}
  language {Language.make!}
end
