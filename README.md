# Install Custom VCPKG GitHub Action

这个 GitHub Action 允许你在 CI/CD 流水线中安装自定义的 VCPKG 实例，支持从指定的仓库和分支安装。跨平台支持 Windows、macOS 和 Linux。

## 使用方法

### 基本使用

```yaml
- name: Install Custom VCPKG
  uses: RealChuan/install-vcpkg@main
  with:
    repo: 'https://github.com/microsoft/vcpkg.git'
    branch: 'master'
```

## 输入参数

| 参数 | 描述 | 必需 | 默认值 |
|------|------|------|---------|
| `repo` | VCPKG 仓库 URL | 否 | `https://github.com/microsoft/vcpkg.git` |
| `branch` | 要使用的分支、标签或提交 | 否 | `master` |

**注意**: 这个 Action 会修改系统级的安装和配置，请确保在受信任的环境中使用。
