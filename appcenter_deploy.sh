#!/bin/bash

appcenter distribute release \
        --group Collaborators \
        --file ${APPCENTER_PATH_APK} \
        --release-notes 'Versao gerada pelo Jenkins Automatica' \
        --app ${APPCENTER_NAME_APP} \
        --token ${APPCENTER_TOKEN} \
        --quiet
