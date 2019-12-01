# Signing Git commits

1. Generate key using GPG Suite 
1. gpg --list-secret-keys --keyid-format LONG
1. git config --global user.signingkey AAAAAAAAAAAAAAA (`sec   rsa4096/{ THIS_KEY_HERE }`)
1. git config --global commit.gpgsign true
1. echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
1. gpg --armor --export AAAAAAAAAAAAAAA | pbcopy
1. Add public key to GitHub
1. git config commit.gpgsign true