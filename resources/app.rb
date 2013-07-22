
actions :add, :remove
default_action :add

attribute :name,              :kind_of => String,   :name_attribute => true
attribute :description,       :kind_of => String
attribute :current_version,   :kind_of => String,   :default => '0'
attribute :deploying,         :kind_of => [TrueClass, FalseClass], :default => false
attribute :last_deploy,       :kind_of => DateTime
