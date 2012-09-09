Description
===========

Installs lvm2 package and ensures it stays upgraded. This cookbook provides resources and providers to create lvm physical volumes, groups and logical volumes.

Requirements
============

* Debian/Ubuntu
* RHEL/CentOS

Resources/Providers
===================

This cookbook provides three resources and corresponding providers.

`pvolume.rb`
-------------

Manage physical lvm volume on the block device

Actions:

* `create` - create a new physical volume.

Attribute Parameters:

* `name` - physical volume name. This is name_attribute.
* `other_options` - options hash passed to pvcreate.

`group.rb`
-------------

Manage lvm groups

Actions:

* `create` - create a new group on physical volume.

Attribute Parameters:

* `name` - group name. This is name_attribute.
* `physical_volumes` - name of physical volume(s).
* `other_options` - options hash passed to vgcreate.

`volume.rb`
-------------

Manage lvm logical volumes

Actions:

* `create` - create a new logical volume in volume group.

Attribute Parameters:

* `name` - logical volume name. This is name_attribute.
* `size` - logical volume size.
* `volume_group` - name of volume group.
* `other_options` - other options hash passed to lvcreate.

Usage
=====

Make sure the lvm package is always up to date with this recipe. Put
it in a base role that gets applied to all nodes.

Mark block device as physical lvm volume:

    lvm_pvolume "/dev/sdb1"

Create volume group on physical volume /dev/sdb1:

    lvm_group "system" do
        physical_volumes "/dev/sdb1"
    end

Create logical volume in volume group system:

    lvm_volume "lv_01" do
        size "10G"
        volume_group "system"
    end

License and Author
==================

Author:: Joshua Timberman <joshua@opscode.com>

Copyright:: 2011, Opscode, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
