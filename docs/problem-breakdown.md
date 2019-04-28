Feature: Posts can have new lines in them
=========================================

(line breaks)

[Link to trello card](https://trello.com/c/BFcRNJGu/11-posts-can-have-new-lines-in-them-low)



Feature: Posts appear with newest post first
============================================

[Link to trello](https://trello.com/c/4e1TZC2k/9-posts-appear-with-newest-post-first-low)



Feature: Posts show the date they were posted
=============================================

[Link to trello card](https://trello.com/c/vSf6LfWB/10-posts-show-the-date-they-were-posted-low)

Low

- Date stamp of each post submission shown in posts lists page



Feature: Users can update and delete their own posts
====================================================

[Link to trello card](https://trello.com/c/zGdTbcSV/17-users-can-update-and-delete-their-own-posts-high)

## Pre-requisites

Blocked until https://trello.com/c/XTCQDWMN/7-users-can-sign-up-medium is complete. You can move to "To do" when that's done.


## Importance

High


## Acceptance Criteria

- A non-signed-in user will be redirected to the index page.

- A signed-in user can:
  - update their own posts for a maximum of 10 mins after they're created

```
User story 1: Update posts
--------------------------
As a user,
so that I can correct spelling mistakes,
I want to be able to update my own posts
```

Objects | Messages
--------------- | ---------------
User | 
Post | update

1. Feature test updating any post
    - method to click to update
    - redirect to message page
    - editable pre-populated message with submit button
    - submit redirects back to 'timeline' (posts#index)


```
User story 2: Update own posts
------------------------------
As a user,
so that the integrity of shared posts is maintained,
I want to be sure that only I can update my posts.
```

1. DB migration to associate a user to many posts
    - add `user_id` as foreign key to `posts` table
    - add `belongs_to :user` into Post model
    - merge `user_id` with params in posts_controller

2. When `edit` post is clicked - check if `user_id` of post = `current_user.id`



  - see a helpful error message if they try to update another user's post
  - delete their own posts
  - see a helpful error message if they try to delete another user's post



## Requirements

- Run a database migration to associate a user to many posts
- Investigate if any current data in any of the prod/dev databases would cause problems if tables were updated
- Add new routes and controller actions
- https://guides.rubyonrails.org/routing.html#nested-resources