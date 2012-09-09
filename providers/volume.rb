action :create do
  
  options = new_resource.other_options.map{|k,v| "#{k} #{v}" }.join(" ")

  execute "lvcreate -n #{new_resource.name} -L #{new_resource.size} #{options} #{new_resource.volume_group}" do
    not_if "lvdisplay #{new_resource.volume_group}/#{new_resource.name}"
  end

end

action :remove do
  
  execute "lvremove -f #{new_resource.volume_group}/#{new_resource.name}" do
    only_if "lvdisplay #{new_resource.volume_group}/#{new_resource.name}"
  end

end
