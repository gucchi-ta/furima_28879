# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...




# テーブル設計
<!-- マークダウン記法で記述 -->

<!-- ユーザー管理機能のテーブル -->
## usersテーブル

| Column     | Type    | Options    |
| ---------- | ------- | ---------- |
| nickname   | string  | null:false |
| email      | string  | null:false |
| password   | string  | null:false |
| first_name | string  | null:false |
| last_name  | string  | null:false |
| first_kana | string  | null:false |
| last_kana  | string  | null:false |


### association

- has_many :buys
- has_many :items

<!-- 商品情報のテーブル -->
## itemsテーブル

| Column   | Type       | Options                       |
| -------- | ---------- | ----------------------------- |
| item     | string     | null:false                    |
| text     | string     | null:false                    |
| price    | integer    | null:false                    |
| user     | references | null:false, foreign_key: true |

### association

- belongs_to :user
- has_one :buy

<!-- 購入情報のテーブル -->
## buysテーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------  |
| card_num    | integer    | null:false                    |
| expiration  | integer    | null:false                    |
| cvv         | integer    | null:false                    |
| postal_code | integer    | null:false                    |
| city        | string     | null:false                    |
| street      | string     | null:false                    |
| house       | string     |                               |
| telephone   | integer    | null:false                    |
| user        | references | null:false, foreign_key: true |
| item        | references | null:false, foreign_key: true |

### association

- belongs_to :user
- belongs_to :item