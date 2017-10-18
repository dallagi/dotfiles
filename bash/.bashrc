case `uname` in
'Darwin')
# Mac specific settings

    alias md5='md5 -r'
    alias md5sum='md5 -r'
    export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# End Mac specific settings
;;
'Linux')
# Linux specific settings

  # <...put Linux specific settings in here...>

# End Linux specific settings
;;
esac
