OPENSSL_STTIC=true
OPENSSL_DIR=${PWD}/openssl-static/
export OPENSSL_STATIC
export OPENSSL_DIR

all:
	cargo +nightly build --target=aarch64-linux-android --verbose --release