# テーブル設計

## users(ユーザー情報） テーブル

| Column             | Type   | Options     
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false, unique: true |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name_kana   | string | null: false               |
| birth_day          | string | null: false               |

### Association

-has_many :items
-has_many :orders


## items(商品情報） テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| situation_id       | integer    | null: false                    |
| shopping_cost_id   | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association

-belongs_to :user
-has_one :order

## destinations(発送先情報) テーブル

| Column             | Type       | Options                        |
| ------------------ | -----------| -------------------------------|
| post_code          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| build              | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |


### Association

-belongs_to :order

## orders(購入記録)テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


### Association

-belongs_to :user
-belongs_to :item
-has_one :destination

