# tsukumo-pc

NixOS-WSL 環境の `/etc/nixos` 設定を管理するブランチです。ブランチ名は `tsukumo-pc`、設定上のホスト名は `wsl` です。

## 構成

| ファイル | 内容 |
| --- | --- |
| `configuration.nix` | モジュールの読み込み、ホスト名、ユーザー、互換性基準 |
| `wsl.nix` | NixOS-WSL |
| `nix.nix` | Nix の設定と追加の Nixpkgs 検索先 |
| `packages.nix` | システムに導入するパッケージ |
| `services.nix` | SSH、Docker、rpcbind |
| `shell.nix` | シェルと開発ツールの連携 |
| `fonts.nix` | GUI 用フォントと Fontconfig |

`system.stateVersion = "25.11"` は互換性基準として保持します。OS の更新先を指定する値ではありません。

## 作業と検証

システムの取得元はチャンネルで管理します。このリポジトリには `flake.nix`、`flake.lock`、`.envrc` を置きません。

システムの検証には root の `nixos`（stable）と `nixos-wsl` チャンネルが必要です。リポジトリのルートで次を実行します。ビルドだけで、稼働中の設定は変更しません。

```sh
nix build --impure --no-link \
  --file /nix/var/nix/profiles/per-user/root/channels/nixos/nixos \
  -I nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos \
  -I /nix/var/nix/profiles/per-user/root/channels \
  -I nixos-config="$PWD/configuration.nix" system
```

## 配置と適用

既存の `/etc/nixos` をバックアップし、次の7ファイルを配置します。

```sh
sudo install -m 0644 \
  configuration.nix wsl.nix nix.nix shell.nix \
  packages.nix services.nix fonts.nix /etc/nixos/
sudo nixos-rebuild switch \
  -I nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos
```

`nixpkgs-unstable` は追加の検索先です。システムの再構築には stable の `nixos` チャンネルを明示します。
