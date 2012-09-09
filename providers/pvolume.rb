action :create do
  
  options = new_resource.other_options.map{|k,v| "#{k} #{v}" }.join(" ")

  execute "pvcreate #{options} #{new_resource.name} " do
    only_if "pvdisplay #{new_resource.name}"
  end

end
