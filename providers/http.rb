
action :add do
  if http_healthcheck_enabled?(new_resource.service, new_resource.url)
    new_resource.updated_by_last_action(false)
  else
    Chef::Log.info "Setting http healthcheck for #{new_resource.service}"
    node.set['healthchecks'][new_resource.service]['http'][new_resource.url] = { 'enabled' => true }
    new_resource.updated_by_last_action(true)
  end
end

action :remove do
  if http_healthcheck_exists?(new_resource.service, new_resource.url)
    Chef::Log.info "Removing http healthcheck for #{new_resource.service}"
    node.set['healthchecks'][new_resource.service]['http'][new_resource.url] = nil
    new_resource.updated_by_last_action(true)
  else
    new_resource.updated_by_last_action(false)
  end
end

action :enable do
  if http_healthcheck_enabled?(new_resource.service, new_resource.url)
    new_resource.updated_by_last_action(false)
  else
    Chef::Log.info "Enabling previously disabled http healthcheck for #{new_resource.service}"
    node.set['healthchecks'][new_resource.service]['http'][new_resource.url]['enabled'] = true
    new_resource.updated_by_last_action(true)
  end
end

action :disable do
  if http_healthcheck_enabled?(new_resource.service, new_resource.url)
    Chef::Log.info "Disabling previously enabled http healthcheck for #{new_resource.service}"
    node.set['healthchecks'][new_resource.service]['http'][new_resource.url]['enabled'] = false
    new_resource.updated_by_last_action(true)
  else
    new_resource.updated_by_last_action(false)
  end
end
