# テーブル設計

## users テーブル

| Column              | Type    | Options                    |
| ------------------- | ------- | -------------------------- |
| nickname            | string  | null: false                |
| email               | string  | null: false, unique: true  |
| encrypted_password  | string  | null: false                |
| family_name         | string  | null: false                |
| first_name          | string  | null: false                |
| family_name_reading | string  | null: false                |
| first_name_reading  | string  | null: false                |
| birthday            | date    | null: false                |

### Association

- has_many :products
- has_many :shipping_records


## products テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| product       | string     | null: false, limit: 40         |
| caption       | text       | null: false, limit: 1000       |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| fee_id        | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| period_id     | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

-belongs_to :category
-belongs_to :condition
-belongs_to :shipping_charge
-belongs_to :shipping_area
-belongs_to :date_of_shipment
-belongs_to :user
-has_one :shipping_record


## shipping_addresses テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| postal_code      | string  | null: false |
| prefecture_id    | integer | null: false |
| city             | string  | null: false |
| house_number     | string  | null: false |
| building_name    | string  |             |
| telephone_number | string  | null: false |

### Association

-belongs_to :shipping_record


## shipping_records テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| product          | references | null: false, foreign_key: true |
| shipping_address | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :product
-has_one :shipping_address