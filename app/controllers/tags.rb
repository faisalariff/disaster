get '/tags' do
  # Look in app/views/index.erb
  @tags = Tag.all
  erb :'tag/tag_list'
end


get '/tags/:id' do
  # Look in app/views/index.erb
  tag = Tag.find(params[:id])
  @tag_name = tag.name
  @posts = tag.posts
  erb :'tag/post_by_tag'
end
