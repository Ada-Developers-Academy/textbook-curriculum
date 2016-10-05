# Resource Routes
## A Shortcut Method of  defining Routes

We have in the past defined routes as below
```ruby
	get 'users/show/:id' => 'users#show', as: user_show
	post 'users/create' => 'users#create'
	...
```

However there is a shortcut by declaring a resource in routes.rb

```ruby
resources :articles
```

This defines the following routes for you.

| Http Verb | Path                     | Controller#Action | Named Helper           | 
|-----------|--------------------------|-------------------|------------------------| 
| get       | /articles          | articles#index    | articles_path          | 
| get       | /articles/new      | articles#new      | new_article_path       | 
| post      | /articles          | articles#create   | articles_path          | 
| get       | /articles/:id      | articles#show     | article_path(:id)      | 
| get       | /articles/:id/edit | articles#edit     | edit\_article\_path(:id) | 
| patch/put | /articles/:id      | articles#update   | article_path(:id)      | 
| delete    | /articles/:id      | articles#destroy  | article_path(:id)      | 


### Don't get lazy

Do **not** define routes that you do not need.  If you want to use resources to determine routes, but only use some of them you can use *only:* as shown in the following to limit the routes created to the listed ones.

```ruby
resources :articles, only: [:index, :new, :create]
```

### Singular Resources
Sometimes you will have a resource that users can get to without the URL specifying the ID.  A good example would be user profiles where it will always show the current user's profile.  If you accidentally misspell a resource as singular instead of plural, then you **could** end up with routes that you didn't intend.  

```ruby
resource :profile
```


| Path      | Controller#Action | Used for          |                                               | 
|-----------|-------------------|-------------------|-----------------------------------------------| 
| get       | /profile/new     | profiles#new     | return an HTML form for creating the profile | 
| post      | /profile         | profiles#create  | create the new profile                       | 
| get       | /profile         | profiles#show    | display the one and only profile resource    | 
| get       | /profile/edit    | profiles#edit    | return an HTML form for editing the profile  | 
| put/patch | /profile         | profiles#update  | update the one and only profile resource     | 
| delete    | /profile         | profiles#destroy | delete the profile resource                  | 


### Resources
- [Rails Guide on RESTful Routing](http://guides.rubyonrails.org/routing.html#singular-resources)
-  [Rails API Guide to Resources](http://api.rubyonrails.org/classes/ActionDispatch/Routing/Mapper/Resources.html)

