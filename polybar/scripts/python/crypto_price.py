#!/usr/bin/env python3
import requests

def fetch_prices():
    url = "https://api.coingecko.com/api/v3/simple/price"
    params = {
        "ids": "bitcoin,ethereum,cardano,solana,polkadot",
        "vs_currencies": "usd"
    }
    response = requests.get(url, params=params)
    data = response.json()
    prices = {
        "Bitcoin": data["bitcoin"]["usd"],
        "Ethereum": data["ethereum"]["usd"],
        "Cardano": data["cardano"]["usd"],
        "Solana": data["solana"]["usd"],
        "Polkadot": data["polkadot"]["usd"]
    }
    return prices

def main():
    prices = fetch_prices()
    output = "\n".join(f"{k}: ${v:.2f}" for k, v in prices.items())
    print(output)

if __name__ == "__main__":
    main()
