# アプリケーション名
Hide and Chef

# アプリケーション概要
自分の料理を出品できるサービスです。  
料理を提供する場所は何処でもOKです。  
レンタルスペース、シェアキッチン、自宅、海、川などアイディア次第でどこでも。

# URL

# テスト用アカウント

# 利用方法
【シェフとして料理を出品したい場合】  
1.まずはSign upしてください。  
2.次にシェフ登録をしてください。  
3.シェフページよりコース料理の登録をしてください。  
  
【ユーザーとしてシェフの料理を食べたい場合】  
1.まずはSign upしてください。  
2.食べたい料理、会いたいシェフを探して、予約してください。  
3.予約確定と同時に決済されます。  
  
# 目指した課題解決
お店を持っていないシェフとユーザーとのマッチングを図る。  
好きな時に好きな場所で、自由に自分の料理を提供する。

【ターゲット】  
シェフ  
・自分のお店を持ちたいが、資金がなくて断念している人  
・開店前にレシビのレビューをもらってブラッシュアップしたい人  
・気軽に自分の料理の腕前を披露してみたい人  
・料理で副収入を得たい人  
  
ユーザー  
・お店で食べることに飽きた人  
・シェフの卵を発掘、投資したい人  
・料理のレビューをしたい人  
  
# 洗い出した要件
[要件定義](https://docs.google.com/spreadsheets/d/1jMh8WXwcRdqSNvRinptdM5J35c7pY3pIFzz17c84E5Y/edit?usp=sharing)

# 実装した機能についてのGIFと説明

# 実装予定の機能
・シェフのコース料理提供をカレンダーで管理  
・予約可能状況がわかるカレンダーから予約可能な日を選択できるようにする  
・レビュー投稿機能の実装  
・寄付機能の実装  

# ローカルでの動作方法

# データベース設計
[ER図](https://drive.google.com/file/d/1JIHeqMOpKnmXzBkaNFyw-fCkb3aiKyot/view?usp=sharing)

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
- has_one :card


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
| chef           | references | null: false, foreign_key: true | 

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

## Cards テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card_token     | string     | null: false                    |
| customer_token | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## Sns_credentials テーブル

| Column   | Type       | Options                        |
| ---------| ---------- | ------------------------------ |
| provider | string     |                                |
| uid      | string     |                                |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user