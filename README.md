# README
---
## users Table

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
* has_one :profile
* has_many :evaluations
* has_many :progresses
* has_many :reviews
---
## profile Table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| contact | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| team_id | integer    | null: false                    |

### Association
* belongs_to :user
* belongs_to_active_hash :team
---
## evaluation Table

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| goal   | text       | null: false                    |
| room   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association
* belongs_to :user
* has_many :progresses
* has_many :reviews
---
## review Table

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| clear      | text       | null: false                    |
| dark       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| evaluation | references | null: false, foreign_key: true |

### Association
* belongs_to :evaluation
* belongs_to :user

---
## progress Table

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| description | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| evaluation  | references | null: false, foreign_key: true |

### Association
* belongs_to :progress
* belongs_to :evaluation
---