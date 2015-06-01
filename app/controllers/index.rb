enable :sessions

def login?
  if session[:username].nil?
    return false
  else
    return true
  end
end

def username
  return session[:username]
end

get '/' do
  # Look in app/views/index.erb
  @posts = Post.all
  erb :index
end

post '/login' do
  @user = User.authenticate(params[:username], params[:password])
   if @user
     session[:username] = @user[:username]
     redirect '/'
   else
      @post
     erb :post
   end
end

get '/logout' do
  session[:username] = nil
  redirect "/"
end

get '/signup' do
  erb :signup
end

post '/signup' do
  @user = User.create(username: params[:username], email: params[:email], password: params[:password])
   if !@user.new_record? #Returns true if this object hasn’t been saved yet
     session[:username] = params[:username]
     redirect "/"
  else
     @error_msg = @user.errors.full_messages
     erb :signup
  end
end

get '/secure' do
  if !login?
    redirect "/"
  else
    erb :secure
  end
end


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
