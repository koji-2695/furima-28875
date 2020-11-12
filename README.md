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

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname     | string | null: false |
| email    | string | null: false |
| encrypted_password | string | null: false |
| first name | string | null: false |
| first name_kana | string | null: false |
| family name | string | null: false |
| family name_kana    | string | null: false |
| birthday    | date | null: false |

### Association

- has_many :items
- has_many :records
- has_one :address

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| price   | integer | null: false |
| lister   | integer | null: false |
| category_id   | integer | null: false |
| condition_id   | integer | null: false |
| shipping fee_id   | integer | null: false |
| area_id   | integer | null: false |
| shipping date_id   | integer | null: false |
  

### Association

- belongs_to :user
- has_one :record
- has_one :address

## records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association


- belongs_to :user
- belongs_to :item
- has_one :address


## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| postal code | string     | null: false    |
| prefecture_id    | integer | null: false             |
| municipality    | string | null: false               |
| house number    | string | null: false               |
| building name    | string | null: false              |
| phone number    | string | null: false               |
| records    | integer | null: false, foreign_key: true |


### Association


- belongs_to :record

