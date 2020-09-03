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
- belongs_to  :item
- has_one    :Address


## Addresses テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------------------- |
| postal_code        | string     | null: false                   |
| city               | string     | null: false                   |
| house_number       | string     | null: false                   |
| building_name      | string     |                               |
| phone_number       | string     | null: false                   |
| prefecture_code_id | integer    | null: false                   |
| shopping           | references | null: false foreign_key: true |


### Association

- belongs_to  :shopping


## items テーブル

| Column             | Type        | Options                       |
| ------------------ | ----------- | ----------------------------- |
| name               |  string     | null: false                   |
| image              |  string     | null: false                   | 
| explanation        |  text       | null: false                   |
| price              |  integer    | null: false                   |
| user               |  references | foreign_key: true null: false |
| category_id        |  integer    | null: false                   |
| condition_id       |  integer    | null: false                   |
| delivery_id        |  integer    | null: false                   |
| shipping_origin_id |  integer    | null: false                   |
| arrival_day        |  integer    | null: false                   |

### Association

- belongs_to :user
- has_one :shopping

<!--
## Active Storageを用いた場合のテーブル設計

| Column             | Type        | Options                       |
| ------------------ | ----------- | ----------------------------- |
| name               |  string     | null: false                   |
| explanation        |  text       | null: false                   |
| price              |  integer    | null: false                   |
| user               |  references | foreign_key: true null: false |
| category_id        |  integer    | null: false                   |
| condition_id       |  integer    | null: false                   |
| delivery_id        |  integer    | null: false                   |
| shipping_origin_id |  integer    | null: false                   |
| arrival_days       |  integer    | null: false                   |

### Association
- belongs_to :user
- has_one :shopping
- has_one_attached

ActiveRecord
| Column             | Type        | Options                       |
| ------------------ | ----------- | ----------------------------- |
| image              |  string     | null: false                   | 




-->


##  以下の項目は基本変更されないデータのためActive::Hashを使用しidで管理します

### Addressesテーブルで必要な都道府県情報はprefecture_codeモデルを生成し〇〇_idで管理します。
### 「都道府県」 app/models/prefecture.rb

### itemsテーブルで必要なデータは以下のように扱います。「商品カテゴリー」、「状態」、「配送料負担」、「発送地域」、「発送までの日数」は、基本変更されないデータのため以下モデルを作成し、 〇〇_idで管理します。

### 「商品カテゴリー」    app/models/category.rb
### 「状態」           app/models/condition.rb
### 「配送料の負担」     app/models/delivery.rb
### 「発送地域」        app/models/shipping_origin.rb
### 「発送までの日数」   app/models/arrival_days.rb
