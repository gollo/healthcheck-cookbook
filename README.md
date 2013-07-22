# healthcheck cookbook

Use the providers in this cookbook to describe healthchecks that monitoring servers should implement for a given node. This information will be added to node attributes, which can then be queried to configure the monitoring checks.

This cookbook doesn't implement the checking itself, it assumes you've implemented whatever you've specified to be checked. So if you provide an HTTP URL to be checked, you need to have implemented something that listens on that URL.

You also need to implement the monitoring, having it read the node attributes set by these providers and execute the checks accordingly. I'm working on a dashboard app that works in conjunction with these providers.


# Requirements

Only works with chef-server, not chef-solo, since your monitoring server will need to get the node attributes from the server.


# Usage

## HTTP Check

service "my-app" do
  description "An example application to check"
end

healthcheck_http "http://#{node.name}:80/healthcheck" do
  service "my-app"
end


# Author

Author:: Kief Morris (<chef@kief.com>)
