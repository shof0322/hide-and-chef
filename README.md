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
|  機能           | 目的 | 詳細    | ストーリー（ユースケース）|
| -------------- | ---- | ------ | --------------------- |
| ユーザー管理機能  | サービスを利用するユーザー情報を管理する                 | サインアップ、ログイン、ログアウト | deviseを用いて、最低限の機能を実装する |
| シェフ登録機能    | サービス上でシェフとして登録できるようにする             | 必要項目を入力し、登録 | 店舗名、ジャンル、写真、店舗説明、こだわり、配送可能エリア、目標調達額、リターン |
| シェフ詳細表示機能 | サービス上に登録されているシェフ情報を表示できるようにする | 名前、説明、こだわり等々を表示 | シェフ登録前提、シェフページを設けて、そこに情報を表示する |
| コース料理出品機能 | サービス上にコース料理を出品できるようにする             | 必要項目を入力し、出品 | メニュー名、写真、説明、価格、配達可能日時 |
| シェフ一覧表示機能 | シェフを検索するため             | 登録されているシェフをトップページに一覧表示できるようにする | Topページに表示されているシェフ画像からシェフ詳細ページへ飛べる |
| 予約購入機能      | コース料理を予約・購入できるようにする | 必要項目を入力し、購入 | 個人情報、予約日時 |
| マイページの実装  | ユーザー情報を編集するため | クレジットカード情報の登録、ユーザー情報の編集 | クレジットカード情報を登録しないと予約できない |
| カテゴリ選択機能  | 料理を検索するため | カテゴリメニューから出品されているコース料理一覧を表示できるようにする | Topページに表示されているカテゴリから料理詳細ページへ飛べる |
| SNS認証         | ユーザーアカウント登録方法の選択肢を増やす | SNSアカウント（Googleアカウン、Facabookアカウント）を利用したログイン方法を選択肢として追加する | "・ユーザーアカウントの登録方法を「手打ち入力」「Googleアカウントを利用」「Facabookアカウントを利用」の3つから選べるようにする・SNSアカウントを選択した場合、既にパスワードは入力されてる状態で表示される" |
| レビュー投稿機能  | シェフにレビューを投稿できるようにする | 必要項目を入力し投稿、シェフページにレビューが掲載される | 料理を食べた後、シェフページからレビューを投稿できる |
| 寄付機能        | クラウドファンディングできるようにする | シェフに開業資金を寄付できるようにする | "シェフページから寄付できる。寄付後、シェフが設定したリターンに紐づくトークンを発行" |


# 実装した機能についてのGIFと説明
## ユーザー管理機能（SNS認証）
- サインアップ、ログイン、ログアウトの機能を実装。SNS認証も可能。（devise)  
## シェフ登録機能
- ユーザー登録後、シェフとして登録できる。  
## シェフ詳細表示機能
- シェフの詳細情報や登録されているコース料理が見れる。  
## コース料理出品機能
- シェフとして提供したいコース料理を登録できる。  
## シェフ一覧表示機能
- サービスに登録されているシェフがTOPページに表示される。  
## 予約購入機能
- シェフが出品しているコース料理を予約・購入できる。  
## マイページの実装
- クレジットカードの登録、ニックネームの編集ができる。  

# 実装予定の機能
・シェフのコース料理提供をカレンダーで管理  
・予約可能状況がわかるカレンダーから予約可能な日を選択できるようにする  
・レビュー投稿機能の実装  
・寄付機能の実装  

# ローカルでの動作方法
$ bundle install  
$ rails db:create  
$ rails db:migrate  
$ rails s  

# データベース設計
![Hide and Chef](https://user-images.githubusercontent.com/69450534/95071783-2a5fee80-0745-11eb-8b82-7d855a86aa57.jpg)
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