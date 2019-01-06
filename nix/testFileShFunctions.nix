''
testFilePresent () {
  [ -f $1 ] && echo "Test passed: file is present - $1" || (echo "Test failed: file is absent - $1" && exit 1)
}

testFileOrDirAbsent () {
  [ ! -e $1 ] && echo "Test passed: file or dir is absent - $1" || (echo "Test failed: file or dir is present - $1" && exit 1)
}
''
