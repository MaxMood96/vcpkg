vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO mohabouje/WinToast
  REF "v${VERSION}"
  SHA512 e2a4faf9af8a74704b2fb0e82b9aad8262e42e863d037498b7f528f563f4a06ac11f49efa45d450cfa281cf90a9b7f799a710f70003804665554b6df8e71982c
  HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DWINTOASTLIB_BUILD_EXAMPLES=OFF
        -DWINTOASTLIB_QT_ENABLED=OFF
)

vcpkg_cmake_build(TARGET WinToast)

if (NOT DEFINED VCPKG_BUILD_TYPE OR VCPKG_BUILD_TYPE STREQUAL "release")
  file(INSTALL "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel/${VCPKG_TARGET_STATIC_LIBRARY_PREFIX}WinToast${VCPKG_TARGET_STATIC_LIBRARY_SUFFIX}" DESTINATION "${CURRENT_PACKAGES_DIR}/lib")
endif()
if (NOT DEFINED VCPKG_BUILD_TYPE OR VCPKG_BUILD_TYPE STREQUAL "debug")
  file(INSTALL "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-dbg/${VCPKG_TARGET_STATIC_LIBRARY_PREFIX}WinToast${VCPKG_TARGET_STATIC_LIBRARY_SUFFIX}" DESTINATION "${CURRENT_PACKAGES_DIR}/debug/lib")
endif()
file(INSTALL "${SOURCE_PATH}/include/wintoastlib.h" DESTINATION "${CURRENT_PACKAGES_DIR}/include")

configure_file("${CMAKE_CURRENT_LIST_DIR}/Config.cmake.in" "${CURRENT_PACKAGES_DIR}/share/unofficial-${PORT}/unofficial-${PORT}-config.cmake" @ONLY)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")