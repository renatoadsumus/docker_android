#!/bin/bash

appcenter login --token ${TOKEN_APPCENTER}

appcenter test run appium --app "renato-gmail.com/Bitcoin-Calculator" \
	--devices "renato-gmail.com/samsumg" \
	--app-path /root/codigo_aplicacao/app/build/outputs/apk/debug/app-debug.apk \
	--test-series "master" --locale "en_US" \
	--build-dir target/upload
