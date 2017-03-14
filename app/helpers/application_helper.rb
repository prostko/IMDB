module ApplicationHelper

  def current_user
    @current_user ||=User.find_by_id(session[:user_id])
  end

  def require_user
    redirect_to root_path unless current_user
  end

  # def authorized
  #   current_user.id == @wish_list.user_id
  # end


  def parser(thing_to_parse)
    JSON.parse(thing_to_parse)
  end

  def get_movies_by_title( movie_title )
    url = "http://www.omdbapi.com"
    response = RestClient.get url, {params: {s: movie_title}}
    parsed_responses = parser(response.body)

    if parsed_responses['Error'].nil?
      movie_objects = parsed_responses['Search'].map do |resp|
        Movie.create(resp)
      end

      return movie_objects
    else
      false
    end
  end

  def get_movie_by_id( id_to_find )
    url = "http://www.omdbapi.com"

    response = RestClient.get url, {params: {i: id_to_find}}
    parsed_response = parser(response.body)
    @movie = Movie.find_by(imdbID: parsed_response['imdbID'])

    if parsed_response['Response'] == "True"
      @movie.update(parsed_response)
    elsif
      false
    end
  end

end
