module ApplicationHelper
  URL = "http://www.omdbapi.com"

  class MovieInfo
    def initialize(args = {})
      @title       = args.fetch("Title", nil),
      @year        = args.fetch("Year", nil),
      @rated       = args.fetch("Rated", nil),
      @released    = args.fetch("Released", nil),
      @runtime     = args.fetch("Runtime", nil),
      @genre       = args.fetch("Genre", nil),
      @director    = args.fetch("Director", nil),
      @writer      = args.fetch("Writer", nil),
      @actors      = args.fetch("Actors", nil),
      @plot        = args.fetch("Plot", nil),
      @language    = args.fetch("Language", nil),
      @country     = args.fetch("Country", nil),
      @awards      = args.fetch("Awards", nil),
      @poster      = args.fetch("Poster", nil), # this is a URL
      @metascore   = args.fetch("Metascore", nil),
      @imdb_rating = args.fetch("imdbRating", nil),
      @imdb_votes  = args.fetch("imdbVotes", nil),
      @id          = args.fetch("imdbID", nil), # always starts with a tt
      @type        = args.fetch("Type", nil),
      @response    = args.fetch("Response", nil)
    end
  end

  def get_movie_by_id( imbd_id )
    response = RestClient.get URL, {params: {i: imdb_id}}
    parsed_response = parser(response.body)

    if parsed_response[] == "true"
      MovieInfo.new(parsed_response)
    else
       return false
    end
  end

  def get_movie_where( hash_for_find )
    response = RestClient.get URL, {params: hash_for_find}
    parsed_response = parser(response.body)

    if parsed_response == "true"
      MovieInfo.new(parsed_response)
    elsif
      return false
    end
  end

  def parser(thing_to_parse)
    JSON.parse(thing_to_parse)
  end

end
