
action :add do
  if app_defined?(new_resource.name)
    new_resource.updated_by_last_action(false)
  else
    Chef::Log.info "Defining (or redefining) app for healthcheck #{new_resource.name}"
    node.set['healthchecks'][new_resource.name]['_info'] = {
      'description'     => new_resource.description,
      'current_version' => new_resource.current_version,
      'deploying'       => new_resource.deploying,
      'last_deploy'     => new_resource.last_deploy
    }
    new_resource.updated_by_last_action(true)
  end
end

action :remove do
  if app_defined?(new_resource.name)
    Chef::Log.info "Removing app definition for #{new_resource.name}"
    node.set['healthchecks'][new_resource.name] = nil
    new_resource.updated_by_last_action(true)
  else
    new_resource.updated_by_last_action(false)
  end
end
