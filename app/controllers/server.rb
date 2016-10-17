module SinatraCrud
  class Server < Sinatra::Base
    #Get all posts
    get '/' do
      @posts = Post.all
      erb :index
    end

    #Get a single post
    get '/post/:id' do
      @post = Post.find(params[:id])
      erb :show
    end

    #Create a Post
    post '/post' do
      @post = Post.create(title: params[:title],
                          description: params[:description],
                          url: params[:url])
      redirect '/'
    end

    #Update a Post
    put '/post/:id' do
      @post = Post.find(params[:id])
      @post.update(title: params[:title],
                   description: params[:description],
                   url: params[:url])

      @post.save
      redirect '/post/' + params[:id]
    end

    #Delete a Post
    delete '/post/:id' do
      @post = Post.find(params[:id])
      @post.destroy
      redirect '/'
    end
  end
end