# Rails Many-To-Many

This rails app is a blog used to demonstrate a many to many relationship. In this example a blog `post` has many `tag`s and a `tag` has many `post`s.

If you don't want to clone or download the entire app and would rather just see the important files, visit this [gist](https://gist.github.com/n8armstrong/4e94e38c04e86a6990ad).

The models would be generated using the following commands:

```
bin/rails g model Post title content:text
bin/rails g model Tag name
bin/rails g model PostTag post:belongs_to tag:belongs_to
bin/rake db:migrate
```

The `PostTag` is the join table.

To create the *many-to-many* relationship use the **has_many :through** syntax like the following:

```ruby
class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, through: :post_tags
end
```
