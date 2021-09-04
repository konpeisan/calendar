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

# Balance sheet App

## 概要

このアプリはパチンコ・スロットを遊技される方達のための収支表です。

## デモ


## 使い方


## 環境

- 
- 
- 
- 

## 注意事項




# テーブル設計

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
