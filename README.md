# X1Carbon

X1Carbon の `/etc/nixos` 設定を管理するブランチです。ブランチ名は `master`、設定上のホスト名は `X1Carbon` です。

## 構成

| ファイル | 内容 |
| --- | --- |
| `configuration.nix` | モジュールの読み込み、ホスト名、ユーザー、ネットワーク、互換性基準 |
| `hardware.nix` | GRUB、ディスク、カーネル、CPU、Bluetooth |
| `nix.nix` | Nix の設定と unstable のオーバーレイ |
| `packages.nix` | システムに導入するパッケージ |
| `services.nix` | SSH、Docker |
| `shell.nix` | シェルと補完 |
| `desktop.nix` | KDE Plasma 6、Wayland、ログインマネージャー |
| `input.nix` | 日本語ロケール、日本語配列、Fcitx 5 と Mozc、タッチパッド |
| `gaming.nix` | Steam、ゲームコントローラー |
| `fonts.nix` | GUI 用フォントと Fontconfig |

`system.stateVersion = "26.05"` は互換性基準として保持します。OS の更新先を指定する値ではありません。

## 作業と検証

システムの取得元はチャンネルで管理します。このリポジトリには `flake.nix`、`flake.lock`、`.envrc` を置きません。

システムの検証には root の `nixos`（stable）と `unstable` チャンネルが必要です。リポジトリのルートで次を実行します。ビルドだけで、稼働中の設定は変更しません。

```sh
nix build --impure --no-link \
  --file /nix/var/nix/profiles/per-user/root/channels/nixos/nixos \
  -I nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos \
  -I unstable=/nix/var/nix/profiles/per-user/root/channels/unstable \
  -I nixos-config="$PWD/configuration.nix" system
```

## 配置と適用

既存の `/etc/nixos` をバックアップし、次の10ファイルを配置します。`hardware.nix` のディスク指定は X1Carbon 固有です。

```sh
sudo install -m 0644 \
  configuration.nix hardware.nix nix.nix shell.nix \
  packages.nix services.nix desktop.nix input.nix \
  gaming.nix fonts.nix /etc/nixos/
sudo nixos-rebuild switch \
  -I nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos \
  -I unstable=/nix/var/nix/profiles/per-user/root/channels/unstable
```

`unstable` は一部のパッケージ用です。システムの再構築には stable の `nixos` チャンネルを明示します。

## ユーザー設定

Plasma・Fcitx のユーザー設定はこのリポジトリの管理対象に含みません。現在のユーザー環境では、システム設定に加えて以下を設定しています。

- `~/.config/kxkbrc` の `[Layout]` に `LayoutList=jp`。
- `~/.config/fcitx5/profile` に `Default Layout=jp` と `Name=keyboard-jp`。日本語変換には Mozc を使用。
- `~/.config/kwinrc` の `[Wayland]` に `InputMethod[$e]=/run/current-system/sw/share/applications/fcitx5-wayland-launcher.desktop` と `VirtualKeyboardEnabled=true`。
- `~/.config/autostart/org.fcitx.Fcitx5.desktop` に以下を配置し、KWin からの起動に加えて XDG 自動起動が重複するのを防止。

```ini
[Desktop Entry]
Type=Application
Name=Fcitx 5
Hidden=true
```

既存のユーザー設定が英語配列の場合、システム設定の配置だけでは日本語配列に揃わない場合があります。
