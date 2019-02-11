Feature: Desafios do Treinamento - Star Wars

Background:

* url "https://swapi.co/api"
* configure ssl = true


Scenario: Valide que o Yoda não aparece no filme "The Force Awakens"

# busca pelo filme
Given path "films"
  And param search = "The Force Awakens"
When method GET
Then status 200
  * def film = read("classpath:rest/starwars/data/TheForceAwakens.json")
  And match response.results[0] == film

# busca pelo personagem
Given path "people"
  And param search = "Yoda"
When method GET
Then status 200
  * def yoda = read("classpath:rest/starwars/data/Yoda.json")
  And match response.results[0] == yoda

# valida que o personagem não está no filme
And match film.characters !contains yoda.url


@teste
Scenario: Valide se existe um filme com maior número de planetas sem habitantes do que os demais

# busca planetas sem habitantes
Given path "planets"
When method GET
Then status 200




