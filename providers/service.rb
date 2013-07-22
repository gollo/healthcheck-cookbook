
action :add do
  if service_defined?(new_resource.service) && service_description(new_resource.service) == new_resource.description
    new_resource.updated_by_last_action(false)
  else
    Chef::Log.info "Defining service for healthcheck #{new_resource.service}"
    node.set['healthchecks'][new_resource.service]['_info'] = {
      'description'     => new_resource.description,
      'current_version' => new_resource.current_version,
      'deploying'       => new_resource.deploying,
      'last_deploy'     => new_resource.last_deploy
    }
    new_resource.updated_by_last_action(true)
  end
end

action :remove do
  if service_defined?(new_resource.service)
    Chef::Log.info "Removing service definition for #{new_resource.service}"
    node.set['healthchecks'][new_resource.service] = nil
    new_resource.updated_by_last_action(true)
  else
    new_resource.updated_by_last_action(false)
  end
end
