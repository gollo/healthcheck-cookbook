
action :add do
  if node['healthchecks'].nil? ||
    node['healthchecks'][new_resource.service].nil? ||
    node['healthchecks'][new_resource.service]['http'].nil? ||
    node['healthchecks'][new_resource.service]['http'][new_resource.url].nil?
      node['healthchecks'][new_resource.service]['http'][new_resource.url] = { 'enabled' => true }
  end
end

action :remove
  node['healthchecks'][new_resource.service]['http'][new_resource.url] = { 'enabled' => true } = nil
end

action :enable
  if node['healthchecks'].nil? ||
    node['healthchecks'][new_resource.service].nil? ||
    node['healthchecks'][new_resource.service]['http'].nil? ||
    node['healthchecks'][new_resource.service]['http'][new_resource.url].nil?
      node['healthchecks'][new_resource.service]['http'][new_resource.url]['enabled'] = true
  end
end

action :disable
  if node['healthchecks'].nil? ||
    node['healthchecks'][new_resource.service].nil? ||
    node['healthchecks'][new_resource.service]['http'].nil? ||
    node['healthchecks'][new_resource.service]['http'][new_resource.url].nil?
      node['healthchecks'][new_resource.service]['http'][new_resource.url]['enabled'] = false
  end
end
