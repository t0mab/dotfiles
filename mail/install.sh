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
cp -v vombatidae.mutt ~/.mutt/vombatidae.mutt
cp -v signature ~/.mutt/signature
cp -v mailcap ~/.mutt/mailcap
