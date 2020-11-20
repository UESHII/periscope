# README
---
## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

## profile テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| contact | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| team_id | integer    | null: false                    |

## evaluation テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| goal   | text       | null: false                    |
| room   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |

## review テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| clear      | text       | null: false                    |
| dark       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| evaluation | references | null: false, foreign_key: true |

## progress テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| description | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| evaluation  | references | null: false, foreign_key: true |
