 テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false , unique:true |
| encrypted_password | string | null: false |
| first_name      | string   | null: false |
| last_name       | string   | null: false |
| first_name_kana | string   | null: false |
| last_name_kana  | string   | null: false |
| birthday        | date | null: false |


### Association

- has_many : items
- has_many : purchases



## items テーブル
| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| item_name         | string  | null: false |
| category_id        | integer | null: false |
| description       | text    | null: false |
| delivery_change_id   | integer | null: false |
| delivery_time_id     | integer| null: false |
| price             | integer | null: false |
| status_id           | integer  | null: false |
| prefecture_id        | integer  | null: false |
| user          | references | foreign_key: true |


### Association

- belongs_to : user
- has_one : purchase



## shipping_addresses テーブル

| Column       | Type         | Options     |
| ------------ | ------------ | ----------- |
| postal_code  | string     | null: false |
| prefecture_id   | integer    | null: false |
| city         | string       | null: false |
| address      | string     | null: false |
| building     | string       |             |
| tel          | string   | null: false |
| purchase | references | foreign_key: true |


### Association

- belongs_to : purchase


## purchases テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| user      | references | foreign_key: true |
| item     | references | foreign_key: true |


### Association

- belongs_to : user
- belongs_to : item
- has_one : shipping_address

