Community.delete_all

Community.create!(:name => 'Amherst College')
Community.create!(:name => 'University of Rochester')
Community.create!(:name => 'Macalester College')



Channel.delete_all
Channel.create!(:channel => 'Arts')
Channel.create!(:channel => 'Food')
Channel.create!(:channel => 'Lecture')
Channel.create!(:channel => 'Local')
Channel.create!(:channel => 'Nightlife')
Channel.create!(:channel => 'Sports')