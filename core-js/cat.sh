# this script parses cat.bat to find the sources for elm-runtime-*.js
# please make sure that the first line of cat.bat lists all the files

PREFIX="^copy /B "
POSTFIX=" ...elm-mini\.js$"

# take the first line of the file
head -n1 cat.bat |

# find "$PREFIX (files) $POSTFIX"
sed "s_${PREFIX}\(.*\)${POSTFIX}_\1_" |

# windows -> unix paths, replace \ with /
tr \\ / |

# replace + with spacebar
tr + " " |

# cat together
xargs cat > ../elm/elm-runtime.js
