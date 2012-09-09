actions :create, :remove

attribute :name, :kind_of => String, :name_attribute => true
attribute :size, :kind_of => String, :default => "10G"
attribute :volume_group, :kind_of => String, :required => true
attribute :other_options, :kind_of => Hash, :default => {}

def initialize(*args)
      super
            @action = :create
end
