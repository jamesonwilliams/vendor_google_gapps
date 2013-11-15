#!/bin/bash

for file in $(find system -name "*.apk"); do

    apk_name=$(basename $file)
    module_name=${apk_name//\.apk/}

	cat <<- EOF
	include \$(CLEAR_VARS)
	LOCAL_MODULE := $module_name
	LOCAL_SRC_FILES := $file
	LOCAL_MODULE_CLASS := APPS
	LOCAL_MODULE_OWNER := google
	LOCAL_MODULE_TAGS := optional
	LOCAL_CERTIFICATE := PRESIGNED
	LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)
	include \$(BUILD_PREBUILT)

	EOF

done

