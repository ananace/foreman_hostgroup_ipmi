Deface::Override.new(virtual_path:  'hostgroups/_form',
                     name:          'hg_add_ipmi_form',
                     insert_bottom: '#network fieldset',
                     partial:       'foreman_hostgroup_ipmi/form')

