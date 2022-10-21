# テーブル設計

## users テーブル

| Column             | Type   | Options       |
| ------------------ | ------ | ------------- |
| email              | string | null: false   |
| encrypted          | string | null: false   |
| nickname           | string | null: false   |
| first_name         | string | null: false   |
| family_name        | string | null: false   |
| first_name(kane)   | string | null: false   |
| family_name(kana)  | string | null: false   |
| birth_day          | date   | null: false   |

### Association

- has_many :exhibit
- has_one :purchaser

## exhibits(出品商品情報） テーブル

| Column             | Type   | Options                                |
| ------------------ | ------------ | -------------------------------- |
| product_name       | string       | null: false,                     |
| description        | text         | null: false                      |
| category           | string       | null: false                      |
| situation          | string       | null: false                      |
| price              | string       | null: false                      |
| user               | references   | null: false, foreign_key: true   |


### Association

- has_many :purchaser
- belongs_to :user
- has_one :deliveries

## purchasers(買い手情報) テーブル

| Column             | Type       | Options                        |
| ------------------ | -----------| -------------------------------|
| post_code          | string     | null: false                    |
| prefectures        | string     | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| build              | string     | null: false                    |
| phone_number       | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| exhibit            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :exhibit
- has_one :deliveries

## deliveries(配送情報)テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| cost               | string     | null: false                    |
| area               | string     | null: false                    |
| days               | string     | null: false                    |
| selling price      | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| exhibit            | references | null: false, foreign_key: true |
| purchaser          | references | null: false, foreign_key: true |

### Association

- belongs_to :exhibit
- belongs_to :purchaser


