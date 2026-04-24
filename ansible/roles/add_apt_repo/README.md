# add_apt_repo

Role to add APT repository with GPG key.

## Requirements

- Root permissions

## Role Variables

| Variable name | Description |
| ----------- | ----------- |
| repo_name | The repository name |
| repo_key_file_name | The key name as you want to see it in your system |
| repo_gpg_key_url | The download gpg key URL |
| repo_url | The repository URL |
| repo_type | The repository distribution or type |
| repo_release_channel | The release channel to use |

## Dependencies

None

## Example Playbook

```yaml
---
- hosts: localhost
  tasks:
    - name: "Add Repo"
      ansible.builtin.include_role:
        name: add_apt_repo
      vars:
        repo_key_file_name: ""
        repo_gpg_key_url: ""
        repo_url: ""
        repo_type: ""
        repo_release_channel: ""
        repo_name: ""
```

## License

BSD
