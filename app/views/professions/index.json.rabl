collection @professions

attributes :title

node :href do |profession|
  profession_url(profession)
end