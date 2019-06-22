require 'net/http' 
require 'uri' 
require 'json' 

def bet()
    uri = URI.parse("https://casino-gibp.api.relaxg.com/game/play/") 
    request = Net::HTTP::Post.new(uri) 
    request.content_type = "application/x-www-form-urlencoded; charset=UTF-8" 
    request["User-Agent"] = "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0" 
    request["Accept"] = "application/json, text/javascript, */*; q=0.01" 
    request["Accept-Language"] = "pt-BR,pt;q=0.8,en-US;q=0.5,en;q=0.3" 
    request["Origin"] = "https://d1m9u7748ksoao.cloudfront.net" 
    request["Connection"] = "keep-alive" 
    request["Referer"] = "https://d1m9u7748ksoao.cloudfront.net/casino/playtechpop/tigersglory/index.html?partnerId=402&market=gb&remoteusername=&gameid=tigersglory&kinid=sportingbet.com&ticket=&moneymode=fun&lang=pt&currency=USD&imsgame=pop_tigersglory_qsp&lobbyPage=https%253A%252F%252Fcasinogames.sportingbet.com%252Ffcasino%252Fen_US%252Ffcgames%252Fvendorgames%252Fhome.html&relaunchurl=https://gamelauncher-uu-pop-com.vegasgames.sportingbet.com/launcher?real%3D0%26casino%3Dsportingbet.com%26clienttype%3Dcasino%26lobbyPage%3Dhttps://casinogames.sportingbet.com/fcasino/en_US/fcgames/vendorgames/home.html%26brandName%3Dsportingbet.com%26clientplatform%3Dweb%26language%3DPT%26depositPage%3Dhttps://casinogames.sportingbet.com/fcasino/en_US/fcgames/vendorgames/cashier.html%26imsgame%3Dpop_tigersglory_qsp&brandName=sportingbet.com&depositPage=https%253A%252F%252Fcasinogames.sportingbet.com%252Ffcasino%252Fen_US%252Ffcgames%252Fvendorgames%252Fcashier.html&crosslaunchurl=https://gamelauncher-uu-pop-com.vegasgames.sportingbet.com/launcher?real%3D0%26casino%3Dsportingbet.com%26clienttype%3Dcasino%26lobbyPage%3Dhttps://casinogames.sportingbet.com/fcasino/en_US/fcgames/vendorgames/home.html%26brandName%3Dsportingbet.com%26clientplatform%3Dweb%26language%3DPT%26depositPage%3Dhttps://casinogames.sportingbet.com/fcasino/en_US/fcgames/vendorgames/cashier.html%26imsgame%3Dpop_tigersglory_qsp" 
    request.body = JSON.dump({ 
        "sid" => "ea6a23523e2ff85304a52c9f440dc677e7221468", 
        "g" => "tigersglory", 
        "ga" => "spin", 
        "ba" => "80", 
        "restoreVersion" => "13", 
        "immediatePayouts" => "false", 
        "restoreState" => "spin=0" 
    }) 

    req_options = { 
        use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http| 
        http.request(request) 
    end 
    bet = JSON.parse(response.body)["win"]
end

totalLoss = 0
balance = 100 * 100

for i in 1..100 do
    win = bet()
    totalLoss += 1 if win == 0
    balance += win - 80

    puts "Round #{i}   - Win: #{win/100.0}      -- Saldo: #{balance/100.0}    -- Total de Rounds sem Vitória: #{totalLoss}"
end

puts "Final $$$ => #{balance/100.0}"