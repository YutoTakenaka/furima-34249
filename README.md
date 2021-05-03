 テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |


### Association

- has_many : items
- belongs_to : profiles
- has_many : cards
- has_many : shipping_addresses



## items テーブル
| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| image             |         | null: false |
| item_name         | string  | null: false |
| category          | string  | null: false |
| description       | text    | null: false |
| delivery_change   | integer | null: false |
| delivery_time     | datetime| null: false |
| price             | integer | null: false |
| fee               | integer | null: false |
| profit            | integer | null: false |


### Association

- belongs_to : users



## profiles テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| first_name      | string   | null: false |
| last_name       | string   | null: false |
| first_name_kana | string   | null: false |
| last_name_kana  | string   | null: false |
| birthday        | datetime | null: false |


### Association

- belongs_to : users



## cards テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| card_info     | integer | null: false |
| limit         | integer | null: false |
| security_code | integer | null: false |


### Association

- belongs_to : users



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

- belongs_to : user