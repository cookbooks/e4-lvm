action :create do
  
  options = new_resource.other_options.map{|k,v| "#{k} #{v}" }.join(" ")

  if new_resource.physical_volumes.class == Array
    physical_volumes = new_resource.physical_volumes.join(" ")
  else
    physical_volumes = new_resource.physical_volumes
  end

  execute "vgcreate #{options} #{new_resource.name} #{physical_volumes}" do
    not_if "vgdisplay #{new_resource.name}"
    only_if "pvdisplay #{physical_volumes}"
  end

end
