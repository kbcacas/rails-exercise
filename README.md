## Rails Exercise

### Prerequisites
```
ruby 3.0.3
rails 6.0.6.1
sqlite3 1.4
```

### Setting up the app

#### 1. Install gems
```
$ bundle install
```

#### 2. Setup database
I have prepared initial data to play around for your convenience. Check `db/seeds.rb`
```
$ rails db:setup
```
_This creates the database (`db:create`), loads the schema (`db:schema:load`), and seeds data if there is any (`db:seed`) all in one step._

#### 3. Start the server
```
$ rails server
```

#### 4. Hit up http://localhost:3000



### Of course, We have testing
_“A code that cannot be tested is flawed.” – Anonymous_
```
bundle exec rspec --format documentation
```
