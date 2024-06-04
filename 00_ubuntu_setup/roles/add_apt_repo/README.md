Role Name
=========

Role to add APT repository with GPG key.

Requirements
------------

- Root permissions

Role Variables
--------------
|Variable name|Description|
|-------------|-----------|
|name            | The repositoriy name |
|key_file_name   | The key name as you want to see it in your system| 
|gpg_key_url     | The download gpg key URL|
|repo_url        | The repositoriy URL|
|repo_type       | The repositoriy distrubution or type|
|release_channel | The release channel to use|

Dependencies
------------

N/A

Example Playbook
----------------

```yaml
---
- hosts: localhost
  tasks:
    - name: "Add  Repo"
      ansible.builtin.include_role:
        name: add_apt_repo
      vars:
        key_file_name: ""
        gpg_key_url: ""
        repo_url: ""
        repo_type: ""
        release_channel: ""
        name: ""
```

License
-------

BSD

