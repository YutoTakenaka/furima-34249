 テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false , uniquness:true |
| password | string | null: false |
| encrypted_password | string | null: false |
| first_name      | string   | null: false |
| last_name       | string   | null: false |
| first_name_kana | string   | null: false |
| last_name_kana  | string   | null: false |
| birthday        | datetime | null: false |


### Association

- has_many : items
- has_many : shipping_addresses
- belongs_to : purchases



## items テーブル
| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| item_name         | string  | null: false |
| category          | string  | null: false |
| description       | text    | null: false |
| delivery_change   | integer | null: false |
| delivery_time     | datetime| null: false |
| price             | integer | null: false |
| status            | string  | null: false |
| user_id          | references | foreign_key: true |


### Association

- belongs_to : users
- belongs_to : purchases



## shipping_addresses テーブル

| Column       | Type         | Options     |
| ------------ | ------------ | ----------- |
| postal_code  | integer      | null: false |
| prefecture   | string       | null: false |
| city         | string       | null: false |
| address      | integer      | null: false |
| building     | string       |             |
| tel          | integer      | null: false |


### Association

- belongs_to : users



## purchases テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| user_id          | references | foreign_key: true |
| items_id          | references | foreign_key: true |


### Association

- belongs_to : users
- belongs_to : items