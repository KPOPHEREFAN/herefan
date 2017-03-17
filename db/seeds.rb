artists = %w(BTS TWICE EXO BIGBANG INFINITE 2PM GirlsGeneration TBSK Psy 2NE1 2AM BlockB GOT7)
p_img = '/default-user-image.png'
artists.each do |name|
    Fandom.create(name: "#{name}'s army", title: "Title for #{name}", subtitle: "We Are the #{name}'s Lover", description: "Hellow Newbie lover", profile_img: p_img)
end
