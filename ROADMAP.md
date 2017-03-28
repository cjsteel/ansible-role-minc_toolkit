# file: roles/minc_toolkit/ROADMAP.md

## Changes

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

