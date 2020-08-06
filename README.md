# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| name                  | string | null: false |
| name_reading          | string | null: false |
| birth_year            | string | null: false |
| birth_month           | string | null: false |
| birth_day             | string | null: false |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :order

## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| user_id          | references | null: false |
| image            | string     | null: false |
| item_name        | string     | null: false |
| explanation      | text       | null: false |
| category         | string     | null: false |
| status           | string     | null: false |
| shipping_charges | string     | null: false |
| area             | string     | null: false |
| delivery_days    | string     | null: false |
| price            | integer    | null: false |

### Association

- belongs_to :user
- has_one :order
- has_many :comments

## order テーブル

| Column        | Type      | Options     |
| --------------| --------- | ----------- |
| buyer_user_id | reference | null: false |
| item_id       | reference | null: false |
| postal_code   | integer   | null: false |
| prefectures   | string    | null: false |
| city          | string    | null: false |
| adress        | integer   | null: false |
| building      | string    |             |
| tel           | integer   | null: false |

### Association

- belongs_to :user
- has_one :item

## cards(クレジットカード)
PAY.JPで実装するため不要

## comments テーブル

| Column  | Type      | Options     |
| ------- | --------- | ----------- |
| user_id | reference | null: false |
| item_id | reference | null: false |
| text    | text      | null: false |

### Association

- belongs_to :user
- belongs_to :item