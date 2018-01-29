class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :list
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes/new' do

  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  end

  delete '/recipes/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    redirect to '/recipes'
  end
end
