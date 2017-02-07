#!/bin/bash

if ( java -version 2>&1 | grep "1.7" )
then
    echo "Choose a Bazel version (1-3):"
    echo "  1 - 0.4.4-megvii1-jdk7"
    echo "  2 - 0.4.3-megvii2-jdk7"
    echo "  3 - 0.3.1-megvii5-jdk7"
    read option
    if [ "${option}" == 1 ]
    then
        wget http://brain-ftp.megvii-inc.com/bazel-0.4.4-megvii1-jdk7 -O bazel
    elif [ "${option}" == 2 ]
    then
        wget http://brain-ftp.megvii-inc.com/bazel-0.4.3-megvii2-jdk7 -O bazel
    elif [ "${option}" == 3 ]
    then
        wget http://brain-ftp.megvii-inc.com/bazel-0.3.1-megvii5-jdk7 -O bazel
    else
        echo "Invalid option"
        exit 1
    fi
else
    echo "Choose a Bazel version (1-3):"
    echo "  1 - 0.4.4-megvii1-jdk8"
    echo "  2 - 0.4.3-megvii2-jdk8"
    echo "  3 - 0.3.1-megvii5-jdk8"
    read option
    if [ "${option}" == 1 ]
    then
        wget http://brain-ftp.megvii-inc.com/bazel-0.4.4-megvii1-jdk8 -O bazel
    elif [ "${option}" == 2 ]
    then
        wget http://brain-ftp.megvii-inc.com/bazel-0.4.3-megvii2-jdk8 -O bazel
    elif [ "${option}" == 3 ]
    then
        wget http://brain-ftp.megvii-inc.com/bazel-0.3.1-megvii5-jdk8 -O bazel
    else
        echo "Invalid option"
        exit 1
    fi
fi

chmod +x bazel
