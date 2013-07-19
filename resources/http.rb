
actions :add, :enable, :disable, :remove
default _action :add

attribute :url,       :kind_of => String,   :name_attribute => true
attribute :service,   :kind_of => String,   :default => 'undefined'
