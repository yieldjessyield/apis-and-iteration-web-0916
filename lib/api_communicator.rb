require 'rest-client'
require 'JSON'
require 'pry'

def web_request(url)
rest = RestClient.get(url)
JSON.parse(rest)
end

#puts web_request("http://www.swapi.co/api/films/6/")

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  films_hash = []
#character_hash["results"][0]["films"].each do |our_urls| films_hash << web_request(our_urls)

#character_urls = character_data["films"]
#character_urls.each do |url| films_hash << web_request(url)
  character_urls = character_hash["results"].map do |character_data|
    if character_data["name"].downcase == character
    #binding.pry
      films_hash = character_data["films"]
  end
    end
  films_hash.collect do |url| web_request(url)
#binding.pry
end

    # iterate over the character hash to find the collection of `films` for the given
    #   `character`
    # collect those film API urls, make a web request to each URL to get the info
    #  for that film
    # return value of this method should be collection of info about each film.
    #  i.e. an array of hashes in which each hash reps a given film
    # this collection will be the argument given to `parse_character_movies`
    #  and that method will do some nice presentation stuff: puts out a list
    #  of movies by title. play around with puts out other info about a given film.
end

#get_character_movies_from_api("luke skywalker")

def parse_character_movies(films_hash)
  #binding.pry
  #films_hash[0]["title"].each |
  films_hash.collect do |film|
    puts film["title"]
  end
  # some iteration magic and puts out the movies in a nice list
end

#parse_character_movies(films_hash)

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  #binding.pry
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
