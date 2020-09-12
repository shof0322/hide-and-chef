# テーブル設計

## Users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| first_name_read       | string | null: false |
| last_name_read        | string | null: false |
| birthday              | date   | null: false |


### Association

- has_many :chefs
- has_many :orders


## Chefs テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| name          | string     | null: false                    |
| explanation   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| commitment    | text       | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_num     | string     | null: false                    |
| target_amount | integer    |                                |
| target_return | text       |                                |
| user          | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- has_one :course

## Courses テーブル

| Column         | Type       | Options                        |
| ---------------| ---------- | ------------------------------ |
| menu1          | string     | null: false                    |
| menu2          | string     | null: false                    |
| menu3          | string     | null: false                    |
| explanation    | text       | null: false                    |
| price          | integer    | null: false                    |
| category_id    | integer    | null: false                    |
| shop           | references | null: false, foreign_key: true | 

### Association

- belongs_to :chef
- has_many :orders

## Oderes テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| course        | references | null: false, foreign_key: true |

### Association

- belongs_to :course
- belongs_to :user
- has_many :reservers

## Reservers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_num     | string     | null: false                    |
| reserve_date  | date       | null: false                    |
| reserve_time  | time       | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order