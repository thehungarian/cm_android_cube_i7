docker build -t android_build .
docker run -it --rm -v /home/mach/code/android-x86:/home/mach/code/android-x86 -u mach android_build
