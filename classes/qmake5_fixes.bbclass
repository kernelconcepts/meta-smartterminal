do_install_prepend() {
    find . -name "*.prl" | xargs -r sed -i "s:${STAGING_LIBDIR}/lib: -l:g"
    find . -name "*.prl" | xargs -r sed -i "s:\.so::g"
    find . -name "qt_lib_gui_private.pri" | xargs -r sed -i "s:${STAGING_LIBDIR}/lib: -l:g"
    find . -name "qt_lib_gui_private.pri" | xargs -r sed -i "s:\.so::g"
}

