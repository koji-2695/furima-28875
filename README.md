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
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_one :item
- has_one :record
- has_one :address

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| price   | string | null: false |
| lister   | string | null: false |
| category   | string | null: false |
| condition   | string | null: false |
| shipping fee   | string | null: false |
| area   | string | null: false |
| shipping date   | string | null: false |
  

### Association

- has_one :user
- has_one :record
- has_one :address

## records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| credit card   | references | null: false, foreign_key: true |

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
| phone number    | references | null: false, foreign_key: true |


### Association

- has_one :user
- has_one :item
- has_one :record

