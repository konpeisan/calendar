# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| username           | string | null: false |
| encrypted_password | string | null: false |

### Association
- has_many :budgets
- has_many :halls
- has_many :types

## budgets テーブル

| Column      | Type     | Options     |
| ----------- | -------- | ----------- |
| start_time  | datetime |             |
| price       | string   | null: false |
| recovery    | string   | null: false |
| yen_id      | integer  | null: false |
| memo        | text     |             |

### Association
- belongs_to :user
- has_many :halls
- has_many :types

## halls テーブル

| Column       | Type       | Options    |
| ------------ | ---------- | ---------- |
| hall_name_id | integer    |            |

### Association
- belongs_to :user
- belongs_to :budget

## types テーブル

| Column       | Type       | Options   |
| ------------ | ---------- | --------- |
| type_name_id | integer    |           |
| pachinko     | integer    |           |
| slot         | integer    |           |

### Association
- belongs_to :user
- belongs_to :budget
