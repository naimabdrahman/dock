docker run -dit \
    --rm \
    -p 9090:9090 \
    --name vouch-proxy \
    -e VOUCH_DOMAINS="thechillexbro.xyz,mydomain.com" \
    -e OAUTH_PROVIDER=oidc \
    -e OAUTH_CLIENT_ID=xxxxxxxxxx \
    -e OAUTH_CLIENT_SECRET=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx \
    -e OAUTH_CALLBACK_URL=https://login.thechillexbro.xyz/auth \
    -e OAUTH_TOKEN_URL=https://mydomain.okta.com/oauth2/v1/token \
    -e OAUTH_AUTH_URL=https://mydomain.okta.com/oauth2/v1/authorize \
    -e OAUTH_USER_INFO_URL=https://mydomain.okta.com/oauth2/v1/userinfo \
    -e OAUTH_END_SESSION_ENDPOINT=https://mydomain.okta.com/oauth2/v1/logout \
    -e OAUTH_SCOPES="openid,email" \
    voucher/vouch-proxy

## notes
echo -e "
to be configured in okta
Login redirect URIs     https://login.thechillexbro.xyz/auth
Initiate login URI      https://login.thechillexbro.xyz/auth
"
