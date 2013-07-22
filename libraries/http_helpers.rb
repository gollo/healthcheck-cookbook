
def http_healthcheck_exists? (app, url)
  attribute_exists?('healthchecks', app, 'http', url)
end

def http_healthcheck_enabled? (app, url)
  http_healthcheck_exists?(app, url) && node['healthchecks'][app]['http'][url]['enabled']
end
