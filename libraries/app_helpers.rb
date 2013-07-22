
def app_defined? (name)
  attribute_exists?('healthchecks', name, '_info')
end
