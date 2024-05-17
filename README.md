# Install Custom VCPKG

此 GitHub Action 用于从指定的 Git 仓库和分支设置自定义 VCPKG 实例。它支持在 Windows、macOS 和 Linux 等多种平台上运行。


## 输入参数

### `repo`
- **描述**: 用于安装 VCPKG 的仓库 URL。
- **默认值**: `https://github.com/microsoft/vcpkg`
- **是否必须**: 否

### `branch`
- **描述**: VCPKG 仓库的分支名称。
- **默认值**: `master`
- **是否必须**: 否

## 示例

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      uses: actions/checkout@v2

    - name: Install Custom VCPKG
      uses: RealChuan/install-vcpkg@main
      with:
        repo: 'https://github.com/RealChuan/vcpkg.git'
        branch: 'dev'
```
