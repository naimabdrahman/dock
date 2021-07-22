## konga - gui for kong
## https://hub.docker.com/r/pantsel/konga/
## https://pantsel.github.io/konga/

'''
docker run -p 1337:1337 \
             --network {{kong-network}} \ // optional
             --name konga \
             -e "NODE_ENV=production" \ // or "development" | defaults to 'development'
             -e "TOKEN_SECRET={{somerandomstring}}" \
             pantsel/konga
'''



docker run -p 1337:1337 \
             --network kong-net \
             --name konga \
             -e "TOKEN_SECRET=abcdef12345" \
             pantsel/konga
