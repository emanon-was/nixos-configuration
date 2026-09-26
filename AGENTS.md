# 作業規範

- `master` は X1Carbon の NixOS 設定を管理するブランチ。
- `configuration.nix` が `hardware.nix`、`nix.nix`、`shell.nix`、`packages.nix`、`services.nix`、`desktop.nix`、`input.nix`、`gaming.nix`、`fonts.nix` を読み込む。
- システムの評価には root の `nixos`（stable）と `unstable` チャンネルが必要。
- `/etc/nixos` の設定を扱うため、作業用の `flake.nix`、`flake.lock`、`.envrc` は追加しない。チャンネル方式を維持し、作業ツールは `$CODEX_HOME/flake.nix`（未設定時は `~/.codex/flake.nix`）で管理する。
- Nix ファイル変更後は README のシステムビルド手順で検証する。
- `system.stateVersion` は通常の更新に合わせて変更しない。
- `hardware.nix` のディスク指定は X1Carbon 固有の設定。
- 設定の配置や `nixos-rebuild switch` は、利用者が適用を依頼した場合に実行する。
