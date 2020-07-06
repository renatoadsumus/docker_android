#!/bin/bash

appcenter distribute release \
        --group Collaborators \
        --file "app/build/outputs/apk/debug/app-debug.apk" \
        --release-notes 'Versao gerada pelo Jenkins Automatica' \
        --app nome_loja-gmail.com/Bitcoin-Calculator \
        --token ${TOKEN_APPCENTER} \
        --quiet
