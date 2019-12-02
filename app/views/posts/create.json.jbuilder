json.prediction @post.prediction
json.body @post.body
json.nickname @post.user.nickname
json.name @race_group.name
json.year @race_group.year
json.count @posts_length.count
json.created_at @post.created_at.strftime("%Y/%-m/%-d#{" "}%X")