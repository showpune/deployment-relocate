rm result.yaml
cd bundle
mkdir .imgpkg
kbld -f release.yaml --imgpkg-lock-output .imgpkg/images.yml
imgpkg push -b showpune/kpack-raw:master -f .
imgpkg copy -b showpune/kpack-raw:master --to-repo=showpune/kpack-release
cd ..
imgpkg pull -b showpune/kpack-release:master -o temp
kbld -f temp > result.yaml
rm -rf temp
rm -rf bundle/.imgpkg