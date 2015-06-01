get '/user/:name' do
  # Look in app/views/index.erb
  @posts = Post.where(username: params[:username])
  @user_name = params[:username]
  erb :'user/post_by_user'
end
