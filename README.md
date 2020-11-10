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
| password | string | null: false |
| password(confirm) | string | null: false |
| first name | string | null: false |
| first name(kana) | string | null: false |
| family name | string | null: false |
| family name(kana)     | string | null: false |
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
| category   | integer | null: false |
| condition   | integer | null: false |
| shipping fee   | integer | null: false |
| area   | integer | null: false |
| shipping date   | integer | null: false |
  

### Association

- has_one :user
- has_one :record
- has_one :address

## records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| username   | references | null: false, foreign_key: true |
| item id   | references | null: false, foreign_key: true |

### Association


- has_one :user
- has_one :item
- has_one :address


## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| postal code | string     |                                |
| prefecture    | references | null: false, foreign_key: true |
| municipality    | references | null: false, foreign_key: true |
| building name    | references | null: false, foreign_key: true |
| phone number    | references | null: false, foreign_key: true |


### Association

- has_one :user
- has_one :item
- has_one :record

