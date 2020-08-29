class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
    end
  end
end
## items テーブル

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

 Active Storageを用いた場合のテーブル設計

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
