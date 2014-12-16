# G5 Facebook Api Client

Facebook Graph API Ruby client for G5 apps

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'g5_facebook_api_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install g5_facebook_api_client


## Usage

```client_id``` and ```client_secret``` parameters can either be passed to
the class on instantiation, or set as ```ENV["FACEBOOK_ID"]``` and ```ENV["FACEBOOK_SECRET"]```.

##### User Permissions


```ruby
user = G5FacebookApiClient::User.new("my_client_id", "my_client_secret")
user.permissions
```

##### Page Feed


```ruby
page = G5FacebookApiClient::Page.new("my_page_id", "my_client_id", "my_client_secret")
page.posts
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/g5_facebook_api_client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
