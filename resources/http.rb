
actions :add, :enable, :disable, :remove
default_action :add

attribute :url,       :kind_of => String,   :name_attribute => true
attribute :app,       :kind_of => String,   :default => 'undefined'
