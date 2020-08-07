# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| name                  | string | null: false |
| name_reading          | string | null: false |
| birthday              | date   | null: false |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :users_items, through
- has_one :address

## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| user_id          | integer    | null: false |
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
- has_many :users_items, through
- has_many :comments
- belongs_to :address

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
| user_id       | string    | null: false |
| item_id       | string    | null: false |
| postal_code   | string    | null: false |
| city          | string    | null: false |
| address       | integer   | null: false |
| building      | string    |             |
| tel           | string    | null: false |

### Association

- belongs_to :item
- belongs_to :user

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