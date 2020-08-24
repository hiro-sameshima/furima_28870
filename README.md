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

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| name             | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birthday​         | date    | null: false | 

### Association

- has_many :items
- has_many :shoppings


## shoppings テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| user            | references | foreign_key: true |
| item            | references | foreign_key: true | 

### Association

- belongs_to :user
- has_one    :item
- has_one    :Address


## Addresses テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| postal_code     | string     | null: false       |
| city            | string     | null: false       |
| house_number    | string     | null: false       |
| building_name   | string     |                   |
| phone_number    | string     | null: false       |

### Association

- belongs_to  :item
- belongs_to  :shopping


## items テーブル

| Column          | Type        | Options           |
| --------------- | ----------- | ----------------- |
| name            |  string     | null: false       |
| image           |  string     | null: false       |
| explanation     |  text       | null: false       |
| price           |  integer    | null: false       |
| user            |  references | foreign_key: true |

### Association

- belongs_to :user
- has_one :shopping


##  Active::Hash

| category        |  string     | null: false       |	
| condition       |  string     | null: false       |	
| delivery        |  string     | null: false       |	
| shipping_origin |  string     | null: false       |	
| arrival_days    |  integer    | null: false       | 
| prefecture_code |  integer    | null: false       |