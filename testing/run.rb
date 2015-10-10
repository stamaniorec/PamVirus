system "[ -d fixture ] && rm -r fixture/"
system "cp -r fixture_original/ fixture/"
system "ruby ../pamvirus.rb fixture/ ../icon.png"
