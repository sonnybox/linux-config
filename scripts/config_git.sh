#!/bin/bash
printf "\nThis is how the key generation process looked like:

    gpg --full-generate-key
    gpg --list-secret-keys --keyid-format=long

    * The ID follows after rsa4096/

    gpg --armor --export [Your-GPG-Key-ID]

    * You could use the same key but it is best
      practice to instead create multiple keys

Add key to git:

    git config --global user.signingkey [Your-GPG-Key-ID]
    git config --global commit.gpgsign true

    * The above command enables signing on Git by default

Add identity to git:

    git config --global user.email "sonny@sonnybox.com"
    git config --global user.name "Sonny Box"

\n"
