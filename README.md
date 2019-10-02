# FitNext
本アプリケーションは、高齢者向けオンラインフィットネスサービスです。
フィットネストレーナーからの専門的な指導により、高齢者の健康寿命を延ばすことを目的としています。

# 社会的背景
総務省統計局のデータによると、2018年段階において、65歳以上の高齢者（以下「高齢者」）は35,570,000人。その数は、年々増加しています。
高齢者の70％が自身の健康状態に対し不安を抱えています。しかしながら、男性50％ 女性65％が週１回の運動さえも行っておりません。
その理由として、「何をどうやれば良いかわからない。」という意見が大多数を占めています。
上記の問題を解決するために、FitNextは、、高齢者の運動の習慣化・健康への不安払拭に寄与することを目指します。

![FitNext-logo](https://user-images.githubusercontent.com/50167879/62832630-47498080-bc6c-11e9-86ef-283389bb59cd.png)

## バージョン
Ruby 2.6.3
Rails 5.2.3

## 機能一覧(開発中：10/5現在実装中の機能を以下に掲載）
- [ ] ユーザーログイン機能
- [ ] ユーザー登録機能
  - [ ] 名前、生年月日、性別、メールアドレス、電話番号、顔写真ファイル、住所、自己紹介、Skype名、パスワード
- [ ] ユーザー編集機能
- [ ] ユーザー削除機能
- [ ] トレーナーログイン機能
- [ ] トレーナー登録機能
  - [ ] 名前、生年月日、性別、メールアドレス、電話番号、顔写真ファイル、住所、自己紹介、資格、指導年数、所属、Skype名、パスワード
- [ ] トレーナー編集機能
- [ ] トレーナー削除機能
- [ ] トレーナー一覧表示
- [ ] トレーナー評価機能
  - [ ] ５段階による評価
  - [ ] 文章による評価
- [ ] トレーナータグ付け機能（得意とする指導分野をタグとして登録できる）
- [ ] トレーナー検索機能
  - [ ] 氏名による検索
  - [ ] 指導分野（タグ）による検索
- [ ] ダイレクトメッセージ機能
- [ ] 管理者権限

## 要件定義書・機能一覧
https://docs.google.com/document/d/193T2hf8LcGjoUlHihvit2VoKYqvlYT_ni8UH3wDECB4/edit?usp=sharing

## 画面遷移図/ワイヤーフレーム
https://xd.adobe.com/view/0ee9bcb8-38c0-47b0-458d-fcfddaf57fbd-78d8/grid

## リーンキャンパス
https://drive.google.com/file/d/1dbFFfxZ3_dKulzEkcpDS8h5fGG3d4TO7/view?usp=sharing

## テーブル定義
https://drive.google.com/file/d/1lGH7l5Oh6PWuirqa19-cKN6UnbAfppl-/view?usp=sharing
https://docs.google.com/spreadsheets/d/1RKPmAWuo09VjIAifspCYi6h34bgQYOxv2-tQ-fnN8a8/edit?usp=sharing


## 使用予定Gem
* devise
* Bootstrap
* unicorn
* capistrano一式
