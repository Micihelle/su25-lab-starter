#!/usr/bin/env bash
set -euf -o pipefail

<<<<<<< HEAD
SSH_HOST=${1:-s275-4.cs.berkeley.edu}

for OUTPUT in $(ssh "$SSH_HOST" -G | grep "^identityfile " | cut -d " " -f2-)
do
    filename="${OUTPUT/#\~/$HOME}"
    if [[ -f $filename ]]; then
        echo "You already have an SSH key at: $OUTPUT"
        echo "Make note of this, as you'll need this information later!"
        exit 0
    fi
done

echo "I couldn't find an existing SSH key for you, so let's make one now..."
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ''
echo "Great! Your new SSH key is at: ~/.ssh/id_ed25519"
echo "Make note of this, as you'll need this information later!"
=======
KEY_FILE="$HOME/.ssh/61c-ed25519"

if [ ! -f "$KEY_FILE" ]; then
    ssh-keygen -t ed25519 -f "$KEY_FILE" -C "61Ced25519Key" -N ""
    echo "Great! Your new SSH key is at: $KEY_FILE" 
else
    echo "SSH key already exists at $KEY_FILE. Skipping generation."
fi
>>>>>>> 187804ffb883d271d34572938cde7afd0de673e7
