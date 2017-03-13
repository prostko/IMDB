module ApiHelper

  URL = "http://www.omdbapi.com"

  def get_movie_by_id( imbd_id )

    response = RestClient.get URL, {params: {i: imdb_id}}
    parsed_response = JSON.parse(response.body)

    if parsed_response == "true"
      return parsed_response
    elsif
      return false
    end
  end

  def get_movie_by_param(hash_for_find)
    response = RestClient.get URL, {params: hash_for_find}
    parsed_response = JSON.parse(response.body)

    if parsed_response == "true"
      return parsed_response
    elsif
      return false
    end
  end


end
