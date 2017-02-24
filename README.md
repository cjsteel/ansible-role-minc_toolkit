
ansible-role-minc_toolkit
=========

An Ansible role to install and manage mint-toolkit.


Requirements
------------

* Deployment user on remote system. 

## Resources

### Roles

* [cjsteel/ansible-role-deployment_user]( https://github.com/cjsteel/ansible-role-deployment_user ) - role to create a deployment user.
* [csteel/ansible-role-ensure_dirs](https://github.com/csteel/ansible-role-ensure_dirs) - role used as a dependancy to create local and remote directories.



Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

###  


roles/minc/defaults/main.yml 
---

At minimum you will want to set the name of the `minc_deployment user`.

```shell
# file: roles/ansible-role-minc_toolkit/defaults/main.yml

# minc

# ansible_distribution_major_version": "14",
# ansible_distribution_release : "trusty",
# ansible_distribution_version": "14.04"
# minc-toolkit-1.9.11-20160202-Debian_7.3-x86_64.deb	
# minc-toolkit
# http://packages.bic.mni.mcgill.ca/minc-toolkit/Debian/minc-toolkit-1.0.08-20160205-Ubuntu_15.04-x86_64.deb

minc_deployment_user: '<deployment_user>'
minc_remote_deployment_user : '{{ minc_deployment_user }}'
minc_local_deployment_user : '{{ minc_deployment_user }}'

minc_state   : 'present'
minc_pkg     : 'minc-toolkit'
minc_ver     : '1.0.08'
minc_date    : '20160202'
minc_os_fam  : '{{ ansible_os_family }}'     # Debian, MacOSX?, RedHat
minc_os_dist : '{{ ansible_distribution }}' # Ubuntu, 
minc_os_rel  : '{{ ansible_release }}'
minc_github_stable_package_url : 'http://packages.bic.mni.mcgill.ca/minc-toolkit/Debian/minc-toolkit-1.0.08-20160205-Ubuntu_12.04-x86_64.deb'
minc_local_resource_directory  : 'sys/sw/ubuntu/12.04/minc-toolkit/1.0.08'
minc_local_resource_path       : '{{ minc_local_resource_directory }}/minc-toolkit-1.0.08-20160205-Ubuntu_12.04-x86_64.deb'
minc_remote_resource_directory : '{{ minc_local_resource_directory }}'

minc_ensure_dirs_on_remote:

  minc_remote_resource_dir:

    state          : 'directory'
    path           : '{{ minc_remote_resource_directory }}'
    owner          : '{{ minc_remote_deployment_user }}'
    group          : '{{ minc_remote_deployment_user }}'
    mode           : '0755'


minc_ensure_dirs_on_local:

  minc_local_resource_dir:

    state          : 'directory'
    path           : '{{ minc_local_resource_directory }}'
    owner          : '{{ minc_local_deployment_user }}'
    group          : '{{ minc_local_deployment_user }}'
    mode           : '0755'
```

##  project/group_vars/minc/minc_defaults.yml

If you wanted to keep the value of the `minc_deployment_user` variable private you could overide the value in `defaults/main.yml` by using `group_vars`. 

Create `project/group_vars/minc/minc_defaults.yml`

```shell
mkdir -p group_vars/minc
cp roles/minc/files/minc_defaults.yml group_vars/minc/.
```

Customize:

```shell
nano group_vars/minc/minc_defaults.yml
```

Example:

```shell
minc_deployment_username: 'put_your_deployment_username'
```

### nano inventory/dev

Example:

```shell
[minc]
workstation-001
```

## Example Playbooks

### systems.yml

We use a main playbook called **systems.yml** where we add our **minc.yml** playbook via an include by adding:

```yaml
- include: minc.yml
```

to our playbook:

```yaml
---
- hosts: all
  become: false

- include: deployment_user.yml
- include: shorewall.yml
- include: ldap.yml
- include: minc.yml
- include: workstation.yml

```

### minc.yml

You can create the mink.yml by copying the `roles/minc/files/minc.yml` example playbook. 

```shell
cp roles/minc/files/minc.yml .
```



Default Example

```yaml
---
# project playbook for roles/minc

- hosts: minc
  become: true
  gather_facts: true
  roles:
    - minc

```

## ansible-playbook command

```shell
ansible-playbook systems.yml -i inventory/dev --limit workstation-001
```

Dependencies
------------

## roles/minc/meta/main.yml 

In `roles/minc/meta/main.yml `we use the following entry in the **dependencies** section in order to pass the values of the variables holding the values of the local and remote we want to create as follows:

```yaml
dependencies:

- { role: ensure_dirs, 
        ensure_dirs_on_remote: "{{ minc_ensure_dirs_on_remote }}",
        ensure_dirs_on_local : "{{ minc_ensure_dirs_on_local }}"
  }
```

The values contained in the variables **ensure_dirs_on_remote** and **ensure_dirs_on_local** where defined previously in the file `roles/minc/defaults/main.yml`, the contents of which is listed near the top of this README.md file in the section titled **Variables** .


License
-------

MIT


Author Information
------------------

Christopher Steel
Systems Administrator
McGill Centre for Integrative Neuroscience
Montreal Neurological Institute
McGill University
3801 University Street
Montréal, QC, Canada H3A 2B4
Tel. No. +1 514 398-2494
E-mail: christopherDOTsteel@mcgill.ca
[MCIN](http://mcin-cnim.ca/), [theneuro.ca](http://theneuro.ca)

