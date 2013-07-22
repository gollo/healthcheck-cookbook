
action :add do
  if node['healthchecks'].nil? ||
    node['healthchecks'][new_resource.service].nil? ||
    node['healthchecks'][new_resource.service]['http'].nil? ||
    node['healthchecks'][new_resource.service]['http'][new_resource.url].nil?

puts "KSM: service: #{new_resource.service}"
puts "KSM: url: #{new_resource.url}"
puts "KSM: full attribute: #{node['healthchecks'][new_resource.service]['http'][new_resource.url]}"

      node['healthchecks'][new_resource.service]['http'][new_resource.url] = { 'enabled' => true }
  end
end

action :remove do
  node['healthchecks'][new_resource.service]['http'][new_resource.url] = nil
end

action :enable do
  if node['healthchecks'].nil? ||
    node['healthchecks'][new_resource.service].nil? ||
    node['healthchecks'][new_resource.service]['http'].nil? ||
    node['healthchecks'][new_resource.service]['http'][new_resource.url].nil?
      node['healthchecks'][new_resource.service]['http'][new_resource.url]['enabled'] = true
  end
end

action :disable do
  if node['healthchecks'].nil? ||
    node['healthchecks'][new_resource.service].nil? ||
    node['healthchecks'][new_resource.service]['http'].nil? ||
    node['healthchecks'][new_resource.service]['http'][new_resource.url].nil?
      node['healthchecks'][new_resource.service]['http'][new_resource.url]['enabled'] = false
  end
end
