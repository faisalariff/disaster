get '/newpost' do
  # Look in app/views/index.erb
  erb :'post/newpost'
end

post '/newpost' do
  # Look in app/views/index.erb
  tags = params[:post].delete("tags")
  post = Post.create(params[:post])
  tags = tags.delete(" ").downcase.split(",")
  tags.each do |tag|
    Tag.create(name: tag)
    tag_obj = Tag.where(name: tag)[0]
    post.tags << tag_obj
  end
  redirect '/'
end

get '/posts/:id' do
  @postpage = true
  @post = Post.find(params[:id])
  erb :'post/post'
end

get '/edit/:id' do
  @post = Post.find(params[:id])
  @tags = @post.all_tags
  erb :'post/update'
end

post '/edit/:id' do
  post = Post.find(params[:id])
  tags = params[:post].delete("tags")
  tags = tags.delete(" ").split(",")
  post.update(params[:post])
  post.tags.delete_all
  tags.each do |tag|
    Tag.create(name: tag)
    tag_obj = Tag.where(name: tag)[0]
    post.tags << tag_obj
  end
  redirect "posts/#{post.id}"
end

delete '/post/:id' do
  Post.find(params[:id]).destroy
  redirect '/'
end