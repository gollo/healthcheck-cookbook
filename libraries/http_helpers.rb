
def http_healthcheck_exists? (service, url)
  attribute_exists?('healthchecks', service, 'http', url)
end

def http_healthcheck_enabled? (service, url)
  http_healthcheck_exists?(service, url) && node['healthchecks'][service]['http'][url]['enabled']
end
