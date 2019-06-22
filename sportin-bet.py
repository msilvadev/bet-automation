import requests
import json

def bet():
    headers = {
        'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0',
        'Accept': 'application/json, text/javascript, */*; q=0.01',
        'Accept-Language': 'pt-BR,pt;q=0.8,en-US;q=0.5,en;q=0.3',
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Origin': 'https://d1m9u7748ksoao.cloudfront.net',
        'Connection': 'keep-alive',
        'Referer': 'https://d1m9u7748ksoao.cloudfront.net/casino/playtechpop/tigersglory/index.html?partnerId=402&market=gb&remoteusername=&gameid=tigersglory&skinid=sportingbet.com&ticket=&moneymode=fun&lang=pt&currency=USD&imsgame=pop_tigersglory_qsp&lobbyPage=https%253A%252F%252Fcasinogames.sportingbet.com%252Ffcasino%252Fen_US%252Ffcgames%252Fvendorgames%252Fhome.html&relaunchurl=https://gamelauncher-uu-pop-com.vegasgames.sportingbet.com/launcher?real%3D0%26casino%3Dsportingbet.com%26clienttype%3Dcasino%26lobbyPage%3Dhttps://casinogames.sportingbet.com/fcasino/en_US/fcgames/vendorgames/home.html%26brandName%3Dsportingbet.com%26clientplatform%3Dweb%26language%3DPT%26depositPage%3Dhttps://casinogames.sportingbet.com/fcasino/en_US/fcgames/vendorgames/cashier.html%26imsgame%3Dpop_tigersglory_qsp&brandName=sportingbet.com&depositPage=https%253A%252F%252Fcasinogames.sportingbet.com%252Ffcasino%252Fen_US%252Ffcgames%252Fvendorgames%252Fcashier.html&crosslaunchurl=https://gamelauncher-uu-pop-com.vegasgames.sportingbet.com/launcher?real%3D0%26casino%3Dsportingbet.com%26clienttype%3Dcasino%26lobbyPage%3Dhttps://casinogames.sportingbet.com/fcasino/en_US/fcgames/vendorgames/home.html%26brandName%3Dsportingbet.com%26clientplatform%3Dweb%26language%3DPT%26depositPage%3Dhttps://casinogames.sportingbet.com/fcasino/en_US/fcgames/vendorgames/cashier.html%26imsgame%3Dpop_tigersglory_qsp',
    }

    #Dados necessários para realizar a aposta
    x = { 
        "sid": "ea6a23523e2ff85304a52c9f440dc677e7221468", 
        "g": "tigersglory", 
        "ga": "spin", 
        "ba": "80", 
        "restoreVersion": "13", 
        "immediatePayouts": "false", 
        "restoreState": "spin=0" 
    }

    data = json.dumps(x)

    response = requests.post('https://casino-gibp.api.relaxg.com/game/play/', headers=headers, data=data)

    return response.json()['win']

totalLoss = 0
balance = 100 * 100
betValue = 80

for i in range(100):
    win = bet()

    if win == 0:
        totalLoss += 1

    balance += win - betValue

    textResult = 'Round {}   - Win: {}      -- Saldo: {}    -- Total de Rounds sem Vitória: {}'
    print(textResult.format(i, (win/100.0), (balance/100.0), totalLoss))


textFinal = 'Final R$ => {}'
print('Final $$$ => ', balance/100.0)