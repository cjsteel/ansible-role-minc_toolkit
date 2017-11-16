# file: roles/minc_toolkit/ROADMAP.md

## Bugs

[2017-11-16] Wrong permissions for /opt/minc/

```shell
jle@ace-ws-36:/opt$ ls -al
total 32
drwxr-xr-x  8 root root 4096 Nov 16 10:11 .
drwxr-xr-x 25 root root 4096 Oct 31 06:23 ..
drwxr-xr-x  3 root root 4096 Oct 13 16:12 google
drwxrwxr-x 10 root root 4096 Oct 13 16:13 minc
drwxr-xr-x 10 root root 4096 Oct 13 16:13 minc-1.0.08
drwxr-xr-x  3 root root 4096 Oct 13 16:13 mni-display
drwxr-xr-x  3 root root 4096 Oct 13 16:13 mni-display-2.0.5
drwxr-xr-x  4 root root 4096 Nov 16 10:11 vagrant
```

## Planned Changes

* Complete tasks/main.yml for removals(?)
* minc path should reflect minc version as concieved by https://github.com/BIC-MNI/minc-toolkit-v2 when compiling from scratch. That is:

rather than `/opt/minc-1.0.08/...`
do `/opt/minc/1.9.13/...`
* skel dependency template prefix could be used as vars in defaults/main and tests/vagrant.yml rather than the entire skel template(s) entry
  * vagrant_yml_prefix: `./templates/`
  * defaults_main_yml_prefix: `roles/minc/templates/`
* minc versioning.
* ​

## Refinements

* Add acemenu entry for minc
* add item.state 'absent' to skel role and test.
* add {{ minc_date }} to versioned minc copy and minc template(s) as required
* Add path to /etc/skel/.bashrc
* Add versioning
* Add Ansible variables for os, release and so on.
* Add minc_state 's options **absent** and **purge**.
* Add .alias ? 

