# 作業規範

- `xps` は NixOS-WSL の設定を管理するブランチ。
- `configuration.nix` が `wsl.nix`、`nix.nix`、`shell.nix`、`packages.nix`、`services.nix`、`fonts.nix` を読み込む。
- `wsl.nix` は `<nixos-wsl/modules>` に依存する。システムの評価には stable の Nixpkgs と NixOS-WSL のチャンネルが必要。
- 利用者の指定により、このリポジトリには `flake.nix`、`flake.lock`、`.envrc` を追加しない。チャンネル方式を維持する。
- Nix ファイル変更後は README のシステムビルド手順で検証する。
- `system.stateVersion` は通常の更新に合わせて変更しない。
- 設定の配置や `nixos-rebuild switch` は、利用者が適用を依頼した場合に実行する。
