. ../helpers.sh

set -e

mkdir -p ~/.mutt/tmp

# isync
cp -v mbsyncrc ~/.mbsyncrc

# msmtp
cp -v msmtprc ~/.msmtprc

# mutt
mkdir -p ~/.mutt
cp -v muttrc ~/.muttrc
cp -v mutt-colors-solarized-dark-16.muttrc ~/mutt-colors-solarized-dark-16.muttrc
cp -v signature ~/.mutt/signature
cp -v mailcap ~/.mutt/mailcap
