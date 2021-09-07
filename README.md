# README

# アプリ名

パチンコ・スロット収支表アプリ

## 概要

このアプリはパチンコ・スロットの収支を作成する際、ホール名・機種名を作成し、それを収支に組み込むことで、店舗・機種ごとの収支を分析することができます。

## 本番環境



## 制作背景

他にもすでに出ている収支表アプリは、ごちゃごちゃしていてわかりにくかったり、機能が足りていなかったりと、ちょうどいい感じの収支表アプリがなかったので、自分で使用するために作りました。

## デモ



## 工夫したポイント

- 初見でもわかるようにシンプルに仕上げました
- 収支を年別・月別・店舗別・機種別・パチンコのタイプ別・スロットのタイプ別に分けて分析できるようにしました
- 登録した店舗・機種名からそれらの詳細ページに遷移するボタンを作りました

## 開発環境

- Ruby, Ruby on Rails
- HTML, CSS, JavaScript
- MySQL, Sequel Pro
- GitHub, GitHub Desktop
- Rspec
- VSCode

## 課題や今後実装したい機能

- カレンダーとしての機能を充実させるために、日本の休日や土日の色を変更する
- スマホアプリにして自分のスマホで使用する
- カレンダーのマスをマウスオーバーではなくクリックにする

# DB設計

### Association
- has_many :budgets
- has_many :halls
- has_many :types

## budgets テーブル

| Column      | Type     | Options     |
| ----------- | -------- | ----------- |
| start_time  | datetime |             |
| price       | string   |             |
| recovery    | string   |             |
| memo        | text     |             |
| store_id    | integer  |             |
| type_name_id| integer  |             |
| game_hour   | integer  |             |
| game_minute | integer  |             |

### Association
- belongs_to :user
- belongs_to :hall
- belongs_to :type

## halls テーブル

| Column       | Type       | Options    |
| ------------ | ---------- | ---------- |
| store_id     | string     |            |

### Association
- belongs_to :user
- has_many :budget

## types テーブル

| Column       | Type       | Options   |
| ------------ | ---------- | --------- |
| type_name    | string     |           |
| pachi_slot   | string     |           |
| kind         | string     |           |

### Association
- belongs_to :user
- has_many :budgets
