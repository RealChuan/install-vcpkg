# Install Custom VCPKG GitHub Action

This GitHub Action allows you to install a custom VCPKG instance in your CI/CD pipeline, supporting installation from specified repositories and branches. Cross-platform support for Windows, macOS, and Linux.

## How to use

### Basic use

```yaml
- name: Install Custom VCPKG
  uses: RealChuan/install-vcpkg@main
  with:
    repo: 'https://github.com/microsoft/vcpkg.git'
    branch: 'master'
```

## input parameters

| parameter | describe                          | required | default value                            |
| --------- | --------------------------------- | -------- | ---------------------------------------- |
| `repo`    | VCPKG repository URL              | no       | `https://github.com/microsoft/vcpkg.git` |
| `branch`  | The branch, tag, or commit to use | no       | `master`                                 |

**Notice**: This Action will modify the system-level installation and configuration, please make sure to use it in a trusted environment.
