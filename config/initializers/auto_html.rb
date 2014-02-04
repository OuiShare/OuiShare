AutoHtml.add_filter(:md_link) do |text|
  text.gsub %r{
    \[         # Literal opening bracket
      (        # Capture what we find in here
        [^\]]+ # One or more characters other than close bracket
      )        # Stop capturing
    \]         # Literal closing bracket
    \(         # Literal opening parenthesis
      (        # Capture what we find in here
        [^)]+  # One or more characters other than close parenthesis
      )        # Stop capturing
    \)         # Literal closing parenthesis
  }x, '<a href="\2" target="blank">\1</a>'
end
