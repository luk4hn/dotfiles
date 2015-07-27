set -gx HOSTNAME (hostname)
if status --is-interactive
    keychain --eval --agents ssh --quiet -Q > /dev/null
    [ -e $HOME/.keychain/$HOSTNAME-fish ]; and . $HOME/.keychain/$HOSTNAME-fish
end
