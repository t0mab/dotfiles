. ../helpers.sh

set -e

mkdir -p ~/.mutt/temp

# isync
cp -v mbsyncrc ~/.mbsyncrc

# msmtp
cp -v msmtprc ~/.msmtprc

# mutt
mkdir -p ~/.mutt
cp -v muttrc ~/.muttrc
cp -v vombatidae.mutt ~/.mutt/vombatidae.mutt
