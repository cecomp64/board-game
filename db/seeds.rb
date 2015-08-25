# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Save me some typing
MI = ModifierInstance

def fmi(name)
  MI.find_by(name:name)
end

# Tags
good_t = Tag.find_or_create_by(name: 'good')
bad_t = Tag.find_or_create_by(name: 'bad')

# Modifiers
modifiers = [
  {name: 'move_forward_one', move: 1, tags: [good_t]},
  {name: 'move_backward_one', move: -1, tags: [bad_t]},
  {name: 'add_one_to_roll', roll: 1, tags: [good_t]},
  {name: 'subtract_one_from_roll', roll: -1, tags: [bad_t]},
  {name: 'shared_move_backwards', move: -1, move_other: -1, tags: [bad_t]},
  {name: 'shared_move_forwards', move: 1, move_other: 1, tags: [good_t]},
  {name: 'shared_draw_2_all', draw: 2, draw_other_all: 1, tags: [good_t]},
  {name: 'shared_draw_1_other', draw: 1, draw_other: 1, tags: [good_t]},
  {name: 'discard_one', draw: -1, tags: [bad_t]},
  {name: 'discard_all_one', draw: -1, draw_other_all: -1, tags: [bad_t]},
  {name: 'discard_other_one', draw_other: -1, tags: [bad_t]},
]

modifiers.each do |m| 
  tags_l = m.delete :tags
  mod = Modifier.find_or_create_by m
  mod.tags = tags_l
end

# Geographies
geo_l = ['Portland', 'Napa and Sonoma', 'Tahoe', 'Bay Area']
geo_l.each{|geo| Geography.find_or_create_by(name: geo)}

# Spaces
Geography.all.each do |geo|
  case(geo.name)
    when 'Portland'
      spaces = []
      spaces.each{|sp| Space.find_or_create_by(name: sp, geography: geo)}
    when 'Napa and Sonoma'
      spaces = []
      spaces.each{|sp| Space.find_or_create_by(name: sp, geography: geo)}
    when 'Tahoe'
      spaces = []
      spaces.each{|sp| Space.find_or_create_by(name: sp, geography: geo)}
    when 'Bay Area'
      spaces = []
      spaces.each{|sp| Space.find_or_create_by(name: sp, geography: geo)}
  end
end

# Modifier Instances
#   Cross all geographies and spaces with modifiers... name them consistently for easy finding
#   modifier_in_geography_and_space
Geography.all.each do |geo|
  Modifier.all.each do |mod|
    modi_tmp = MI.find_or_create_by(name: "#{mod.name}_in_#{geo.name.parameterize.underscore}", modifier: mod, geography: geo)
    modi_tmp.tags = mod.tags

    geo.spaces.each do |space|
      modi_tmp = MI.find_or_create_by(name: "#{mod.name}_in_#{geo.name.parameterize.underscore}_and_#{space.name.parameterize.underscore}", modifier: mod, geography: geo, space: space)
      modi_tmp.tags = mod.tags
    end
  end
end

# non-geographic modifier instances
Modifier.all.each do |mod|
  m = MI.find_or_create_by(name: mod.name, modifier: mod)
  m.tags = mod.tags
end

# Quests
quest_l = [
  {
    title: 'Walk Tigger and Mali', 
    text: 'Mali is pulling you after the squirrel and Tigger is desparately trying to not attract any attention to her otherwise peaceful walk.',
    roll: 4,
    modifier_instances: [fmi('add_one_to_roll_in_portland'), fmi('add_one_to_roll_in_bay_area')]
  },
  {
    title: 'Find Locally Sourced, Fair-Trade, Hippy Coffee',
    text: '...',
    roll: 4,
    modifier_instances: [fmi('subtract_one_from_roll_in_tahoe'), fmi('add_one_to_roll_in_bay_area')]
  },
]
quest_l.each do |quest|
  mi_l = quest.delete(:modifier_instances)
  q = Quest.find_or_create_by(quest)
  puts q.inspect
  q.modifier_instances = mi_l
end

# Helper Cards

helper_l = [
  {title: 'Luna Whale Song', text: 'Luna sings you her whale song.  You record it, and it becomes the next dubstep hit.', tag: good_t},
  {title: 'Fruit Salad Virus', text: "You got food poisoning from the fruit salad at Dwight's Speed of Light cafe.  If you are Cat, no bad stuff happens - you didn't eat it.  Otherwise... ", tag: bad_t},
  {title: "Biological Clock", text: "You just watched 2-year old Cameron pick you out of a line up.  It reminds you that you could create an adorable creature of your own.  Time to speed things up.", tag: good_t},
  {title: "Anya Ate Your Undies", text: "It was your last pair.", tag: bad_t},
  {title: "Violin String Broke", text: "... And it's concert night!  Rushing to find a replacement makes you late.", tag: bad_t},
  {title: "Scored a Goal", text: "Your magic foot found the back of the net at Off the Wall.", tag: good_t},
  {title: "Promotion", text: "You got a promotion.  Now you have twice as much work!  Yay?", tag: good_t},
  {title: "Gnar Pow", text: "It snowed 2 feet last night!  Your car spun out on the way, but you are safely on the mountain and ready to shred.", tag: good_t, geography: [Geography.find_by(name: "Tahoe")]},
  #{title: "foo", text: "bar", tag: good_t},
]

helper_l.each do |helper_h|
  tag = helper_h.delete(:tag)
  geography_l = helper_h.delete(:geography)
  modifiers = ModifierInstance.joins(:tags).where("tags.id = #{tag.id}").where(geography: geography_l)

  puts "Modifiers for '#{helper_h[:title]}': #{modifiers}"

  # Pick a random modifier meeting the criteria...
  rnum = rand(modifiers.count)
  helper = Helper.find_or_create_by helper_h
  helper.modifier_instances << modifiers[rnum]

end
