if ( java -version 2>&1 | grep "1.7" )
then
    wget http://brain-ftp.megvii-inc.com/bazel-0.4.0-megvii1-jdk7 -O bazel
else
    wget http://brain-ftp.megvii-inc.com/bazel-0.4.0-megvii1-jdk8 -O bazel
fi

chmod +x bazel
