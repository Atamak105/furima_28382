# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_reading     | string | null: false |
| first_name_reading    | string | null: false |
| birthday              | date   | null: false |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :users_items

## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| user_id          | integer    | null: false ,FK: true |
| image            | string     | null: false |
| name             | string     | null: false |
| explanation      | text       | null: false |
| price            | integer    | null: false |

### Association

- belongs_to :user
- has_many :users_items
- has_many :comments
- has_one :address

### category,status,shipping_charges,area,delivery_days
ActiveHushを使用するため不要

## users_items テーブル

| Column        | Type      | Options     |
| --------------| --------- | ----------- |
| user_id       | string    | null: false |
| item_id       | string    | null: false |

### Association

- belongs_to :user
- belongs_to :item


## address テーブル

| Column        | Type      | Options     |
| --------------| --------- | ----------- |
| item_id       | string    | null: false |
| postal_code   | string    | null: false |
| city          | string    | null: false |
| address       | integer   | null: false |
| building      | string    |             |
| tel           | string    | null: false |

### Association

- belongs_to :item

### prefectures
ActiveHushを使用するため不要

### cards(クレジットカード)
PAY.JPで実装するため不要


## comments テーブル

| Column  | Type      | Options     |
| ------- | --------- | ----------- |
| user_id | integer   | null: false |
| item_id | integer   | null: false |
| text    | text      | null: false |

### Association

- belongs_to :user
- belongs_to :item