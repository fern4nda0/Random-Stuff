#!/bin/zsh

echo "Date: $(date '+%d-%m-%Y') "
# Fetch data from CoinGecko API
prices=$(curl -s "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,dogecoin,litecoin,solana&vs_currencies=usd")

bitcoin_price=$(echo $prices | jq -r '.bitcoin.usd')
ethereum_price=$(echo $prices | jq -r '.ethereum.usd')
dogecoin_price=$(echo $prices | jq -r '.dogecoin.usd')
litecoin_price=$(echo $prices | jq -r '.litecoin.usd')
solana_price=$(echo $prices | jq -r '.solana.usd')

# Print prices
echo "\033[33mBitcoin   \033[0m :  \$ ${bitcoin_price}"
echo "\033[33mEthereum Ξ\033[0m :  \$ ${ethereum_price}"
echo "\033[33mDogecoin Ð\033[0m :  \$ ${dogecoin_price}"
echo "\033[33mLitecoin Ł\033[0m :  \$ ${litecoin_price}"
echo "\033[33mSolana SOL\033[0m :  \$ ${solana_price}"


# Fetch data from CoinGecko API
coins=$(curl -s "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false")


# Print header
printf "%-4s %-15s %-6s %-15s %-15s\n" "Rank" "Name" "Symbol" "Price" "Market Cap"

printf "====================================================================="
echo ""
# Loop over the coins and print their rank, name, symbol, current price, and market cap
for i in $(seq 0 9); do
    rank=$(echo $coins | jq -r ".[$i].market_cap_rank")
    name=$(echo $coins | jq -r ".[$i].name")
    symbol=$(echo $coins | jq -r ".[$i].symbol")
    price=$(echo $coins | jq -r ".[$i].current_price")
    market_cap=$(echo $coins | jq -r ".[$i].market_cap")

    printf "%-4s %-15s %-6s %-15s %-15s\n" "$rank" "$name" "$symbol" "$price" "$market_cap"
done
