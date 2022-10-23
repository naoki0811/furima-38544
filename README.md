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
| birth_day          | date   | null: false               |

### Association

-has_many :products
-has_many :purchases


## products(商品情報） テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| situation_id       | integer    | null: false                    |
| shopping_cost_id   | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| day_id             | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association

-belongs_to :user
-has_one :purchase

## destinations(発送先情報) テーブル

| Column             | Type       | Options                        |
| ------------------ | -----------| -------------------------------|
| post_code          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| build              | string     |                                |
| phone_number       | string     | null: false                    |
| purchase           | references | null: false, foreign_key: true |


### Association

-belongs_to :purchase

## purchase(購入記録)テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |


### Association

-belongs_to :user
-belongs_to :product
-has_one :destination

