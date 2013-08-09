actions :add
default_action :add

attribute :name, :kind_of => String, :name_attribute => true
attribute :version, :kind_of => String
attribute :prerelease, :kind_of => [ TrueClass, FalseClass], :default => false
