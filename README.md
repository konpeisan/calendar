### README.md

## アプリ名

## **パチンコ・スロット収支表アプリ**
---

## 概要
---

このアプリはパチンコ・スロットの収支を作成する際、ホール名・機種名を作成し、それを収支に組み込むことで、店舗・機種ごとの収支を分析することができます。

## 本番環境
---


## 制作背景
---
他にもすでに出ている収支表アプリは、ごちゃごちゃしていてわかりにくかったり、機能が足りていなかったりと、ちょうどいい感じの収支表アプリがなかったので、自分で使用するために作りました。

## デモ
---
トップページ
![](https://i.gyazo.com/5374795706a2831596b5bf9bcf8db80c.gif)

分析一覧ページ
![](https://i.gyazo.com/df11819d2534ac3c8c5cbf406ec97c97.gif)

収支入力ページ
![](https://i.gyazo.com/5bf47fd32ee7566698d73d2442134b84.gif)

ホール作成ページ
![](https://i.gyazo.com/003753f8bae7a4658b192a2fab488876.gif)

機種作成ページ
![](https://i.gyazo.com/25bc9a9ad52562b931830adbefc4e11f.gif)


## 工夫したポイント
---
- 初見でもわかるようにシンプルに仕上げました
- 収支を年別・月別・店舗別・機種別・パチンコのタイプ別・スロットのタイプ別に分けて分析できるようにしました
- 登録した店舗・機種名からそれらの詳細ページに遷移するボタンを作りました

## 開発環境
---
- Ruby, Ruby on Rails
- HTML, CSS, JavaScript
- MySQL, Sequel Pro
- GitHub, GitHub Desktop
- Rspec
- VSCode

## 課題や今後実装したい機能
---
- カレンダーとしての機能を充実させるために、日本の休日や土日の色を変更する
- スマホアプリにして自分のスマホで使用する
- カレンダーのマスから結果作成を表示する際、マウスオーバーではなくクリックにする
- 機種の種類やタイプもユーザー入力タイプにする

# DB設計

### Association
- has_many :budgets
- has_many :halls
- has_many :types

## budgets テーブル

| Column      | Type     | Options     |
| ----------- | -------- | ----------- |
| start_time  | datetime | null: false |
| price       | string   | null: false |
| recovery    | string   | null: false |
| total       | string   | null: false |
| memo        | text     |             |
| store_id    | integer  |             |
| type_name_id| integer  |             |
| game_hour   | integer  |             |
| game_minute | integer  |             |

### Association
- belongs_to :hall
- belongs_to :type

## halls テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| store_id     | string     | null: false |

### Association
- has_many :budget

## types テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| type_name    | string     | null: false |
| pachi_slot   | string     | null: false |
| kind         | string     | null: false |

### Association
- has_many :budgets
