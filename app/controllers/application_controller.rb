<<<<<<< HEAD
=======
require_relative '../../config/environment'
>>>>>>> 0c98772eac485f5842855b2128d3df6b4900ed63
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(params)
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params["id"])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params["id"])
    erb :edit
  end

  patch '/posts/:id' do
    id = params["id"]
    new_params = {}
    old_post = Post.find(id)
    new_params[:name] = params["name"]
    new_params[:content] = params["content"]
    old_post.update(new_params)

    redirect "/posts/#{id}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params["id"])
    @post.destroy
    erb :delete
  end
  
  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
    Article.create(params)
    id = Article.last.id
    
    redirect "/articles/#{id}"
  end
  
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  get '/articles/:id' do
    @article = Article.find(params["id"])
    erb :show 
  end
  
  get '/articles/:id/edit' do
    @article = Article.find(params["id"])
    erb :edit
  end
  
  patch '/articles/:id' do
    id = params["id"]
    new_params = {}
    old_article = Article.find(id)
    new_params[:title] = params["title"]
    new_params[:content] = params["content"]
    old_article.update(new_params)
    
    redirect "/articles/#{id}"
  end
  
  delete '/articles/:id/delete' do
    @article = Article.find(params["id"])
    @articles.destroy(@article)
   
    erb :delete
  end
  
end
