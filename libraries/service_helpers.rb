
def service_defined? (name)
  attribute_exists?('healthchecks', service, '_info')
end
