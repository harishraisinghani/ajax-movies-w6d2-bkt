helpers do
	#return the current user if there is one logged in
	def current_user
		if session[:id] != nil
			@current_user = User.find(session[:id])
		end
	end

	def formatDate(date)
		return Date(date, 'MMM D, YYYY')
	end

end

# Homepage (Root path)
get '/' do

	@movies = Movie.all.reverse
  erb :index
end

# get '/movies' do
# 	@movies = Movie.all.reverse
# 	erb :'movies/index'
# end

#load the new movie form
get '/movies/new' do 
	erb :'movies/new' 
end

# awesomewebsite.com/movies/1
get '/movies/:id' do
	@movie = Movie.find(params[:id])
	# binding.pry
	# @characters = Character.where(movie_id: @movie.id)
	@characters = @movie.characters

	erb :'movies/show'
end

post '/movies/new' do

	name = params[:name]
	year = params[:year]

	#create a new movie
	Movie.create(name: name, year: year)

	#redirect back to all movies
	redirect '/movies'
end

get '/movies/:id/characters/new' do

	@movie = Movie.find(params[:id])

  erb :'characters/new'
end
post '/movies/:id/characters/new' do

	@movie = Movie.find(params[:id])

	name = params[:name]
	gender = params[:gender]
	dies_in_movie = params[:dies_in_movie]
	img_src = params[:img_src]

	# Character.create(movie_id: @movie.id...)
	@movie.characters.create(name: name, gender: gender, dies_in_movie: dies_in_movie, img_src: img_src)

	redirect "/movies/#{@movie.id}"
end

get '/characters' do
	@characters = Character.all
	#load erb
end





get '/api/movies' do
  # binding.pry
  Movie.all.to_json
end

get '/ajax-movies' do
  # binding.pry
  erb :'ajax-movies'
end

post '/api/movie' do
  # binding.pry
end






get '/movies/:movie_id/characters/:character_id' do
	@movie = Movie.find(params[:movie_id])

	@character = Character.find(params[:character_id])

	erb :'characters/show'
end


get '/signup' do
	erb :signup
end
post '/signup' do
	username = params[:username]
	password = params[:password]
	email = params[:email]

	user = User.create(username: username, password: password, email: email)

	session[:id] = user.id

	redirect "/"
end

get '/logout' do
	session[:id] = nil
	redirect '/'
end

get '/login' do 
	erb :login
end	

post '/login' do
	username = params[:username]
	password = params[:password]

	user = User.find_by(username: username, password: password)

	if user != nil
		session[:id] = user.id
		redirect '/'
	else
		redirect '/login'
	end

end

