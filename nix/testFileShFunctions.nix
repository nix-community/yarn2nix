''
testFilePresent () {
  [ -e $1 ] && echo "Found $1" || (echo "Error - not found file $1" && exit 1)
}

testFileAbsent () {
  [ ! -e $1 ] && echo "Not found $1" || (echo "Error - found file $1" && exit 1)
}
''
