#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/vision/vision_ws/src/image_pipeline/camera_calibration"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/vision/vision_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/vision/vision_ws/install/lib/python3/dist-packages:/home/vision/vision_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/vision/vision_ws/build" \
    "/usr/bin/python3" \
    "/home/vision/vision_ws/src/image_pipeline/camera_calibration/setup.py" \
    egg_info --egg-base /home/vision/vision_ws/build/image_pipeline/camera_calibration \
    build --build-base "/home/vision/vision_ws/build/image_pipeline/camera_calibration" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/vision/vision_ws/install" --install-scripts="/home/vision/vision_ws/install/bin"
