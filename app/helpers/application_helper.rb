module ApplicationHelper
  
  def current_user
    @current_user ||=User.find_by_id(session[:user_id])
  end

  def require_user
    redirect_to root_path unless current_user
  end

  def logged_in?
    !!current_user
  end

  def authorized(user_id)
    redirect_to root_path unless user_id == current_user.id
  end


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

  def activity_logger(action, obj_to_log)

    time = " at #{current_time}"

    if current_user
      case action
      when 'search'
        unshift_session(["You searched for '#{obj_to_log}'", time])
      when 'movie'
        unshift_session(["You viewed '#{obj_to_log.Title}'", time])
      when 'like'
        unshift_session(["You liked '#{obj_to_log.Title}'", time])
      when 'comment'
        unshift_session(["You commented on '#{obj_to_log.Title}'", time])
      when 'watchlist'
        unshift_session(["You added '#{obj_to_log.Title}' to your watch list", time])
      end
    end
  end

  def unshift_session(thing_to_unshift)
    if current_user
      session[:history].unshift(thing_to_unshift)
    end
  end

  def current_time
    Time.now.to_datetime.in_time_zone("Central Time (US & Canada)").strftime("%l:%M, %d %b %Y")
  end

end
