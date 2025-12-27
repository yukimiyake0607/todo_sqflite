# プロジェクト概要

## モノレポ

- マルチパッケージ構成
- melosを使用したモノレポ管理
- fvmを使用したFlutterバージョン管理

## セットアップ

### 必要なツール

- Flutter SDK（fvm経由で管理）
- melos
- fvm

### 初期セットアップ

```bash
# fvmでFlutterバージョンを設定（既に設定済み）
fvm use 3.32.5

# 依存関係のインストール
melos bootstrap
```

### VS Code設定

プロジェクトには以下のVS Code設定が含まれています：

- **`.vscode/launch.json`**: デバッグ設定（fvm対応）
- **`.vscode/settings.json`**: FVMパス設定、ファイル除外設定
- **`.vscode/extensions.json`**: 推奨拡張機能

推奨拡張機能をインストールするには、VS Codeで「拡張機能の推奨事項をインストール」を選択してください。

## パッケージ構成

- `packages/todo_sqflite`: メインアプリケーション
- `packages/dart_flutter_common`: Dart/Flutter共通ユーティリティ

## 使用方法

### melosコマンド

```bash
# すべてのパッケージでflutter analyzeを実行
melos run analyze

# すべてのパッケージでdart formatを実行
melos run format

# すべてのパッケージでflutter testを実行
melos run test

# すべてのパッケージでflutter cleanを実行
melos run clean

# すべてのパッケージでflutter pub getを実行
melos run get

# すべてのパッケージのバージョンを更新
melos run version
```

### 個別パッケージでの作業

```bash
# todo_sqfliteパッケージでアプリを実行
cd packages/todo_sqflite
fvm flutter run

# dart_flutter_commonパッケージでテストを実行
cd packages/dart_flutter_common
fvm flutter test
```

## プロジェクト構造

```
todo_sqflite/
├── packages/
│   ├── todo_sqflite/          # メインアプリケーション
│   │   ├── lib/                # Dartソースコード
│   │   ├── android/            # Androidネイティブ設定
│   │   ├── ios/                # iOSネイティブ設定
│   │   ├── macos/              # macOSネイティブ設定
│   │   ├── linux/              # Linuxネイティブ設定
│   │   ├── windows/            # Windowsネイティブ設定
│   │   ├── web/                # Web設定
│   │   └── pubspec.yaml        # アプリの依存関係
│   └── dart_flutter_common/    # 共通ユーティリティパッケージ
│       ├── lib/                # Dartソースコード
│       └── pubspec.yaml        # パッケージの依存関係
├── melos.yaml                  # Melos設定
├── .fvm/                       # FVM設定
└── pubspec.yaml                # ルートの依存関係（melos用）
```

### ネイティブフォルダの配置について

- **アプリケーションパッケージ（`packages/todo_sqflite`）にネイティブフォルダを配置**
  - Flutterは`pubspec.yaml`と同じ階層でネイティブフォルダを探すため、アプリパッケージ内に配置する必要があります
  - これにより、各アプリが独立したネイティブ設定を持つことができます
  - 複数のアプリがある場合にも対応できます

- **ライブラリパッケージ（`packages/dart_flutter_common`）にはネイティブフォルダは不要**
  - ライブラリパッケージはDartコードのみを含むため、ネイティブフォルダは必要ありません

### fvmコマンド

```bash
# 使用中のFlutterバージョンを確認
fvm list

# Flutterバージョンを変更
fvm use <version>

# 最新のstableバージョンをインストール
fvm install stable
```

## レイヤードアーキテクチャ

```
- UI層（Screen）
- Controller層（Controller）
- Service（Service）
- Repository層（Repository）
```

## 状態管理

- hooks_riverpod
- flutter_hooks

## ルーティング

- go_router


