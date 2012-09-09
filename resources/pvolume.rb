actions :create

attribute :name, :kind_of => String, :name_attribute => true
attribute :other_options, :kind_of => Hash, :default => {}

def initialize(*args)
      super
            @action = :create
end
