# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/coroutine
    REF boost-${VERSION}
    SHA512 92549788842fd6e9425dd986ad5469203e25225b9e91a29f6779589126e97eed4669b1f602ca97d3530a5bafab982422d1d14fb14a3536a278783a66ec47fb3d
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
