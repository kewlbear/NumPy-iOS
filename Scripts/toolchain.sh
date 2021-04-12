git clone --depth 1 https://github.com/kewlbear/kivy-ios.git
cd kivy-ios

python3 -m venv venv
. venv/bin/activate

pip install -e .
pip install cython

python toolchain.py build numpy

mv dist/frameworks/libn* .
mv dist/frameworks/numpy.xcframework libnumpy.xcframework

rm -rf ../Sources/NumPySupport/site-packages
mv dist/root/python3/lib/python3.8/site-packages ../Sources/NumPySupport

find ../Sources/NumPySupport/site-packages -name lib\*.a -delete
