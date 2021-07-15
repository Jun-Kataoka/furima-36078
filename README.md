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
| dob_year            | integer | null: false                |
| dob_month           | integer | null: false                |
| dob_day             | integer | null: false                |

### Association

- belongs_to :dob_year
- belongs_to :dob_month
- belongs_to :dob_day
- has_many :products


## products テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            |            | null: false                    |
| product          | string     | null: false, limit: 40         |
| caption          | text       | null: false, limit: 1000       |
| category         | integer    | null: false                    |
| condition        | integer    | null: false                    |
| shipping_charges | integer    | null: false                    |
| shipping_area    | integer    | null: false                    |
| date_of_shipment | integer    | null: false                    |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

-belongs_to :category
-belongs_to :condition
-belongs_to :shipping_charges
-belongs_to :shipping_area
-belongs_to :date_of_shipment
-belongs_to :user
-has_one :shipping_addresses
-has_one :shipping_records


## shipping_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture       | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| product_id       | references | null: false, foreign_key: true |

### Association

-belongs_to :product


## shipping_records テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| product_id       | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :product