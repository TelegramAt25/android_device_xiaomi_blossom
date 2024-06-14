[ -z "$1" ] && echo "please specify patch dir" && exit 2

maindir=$(pwd)
patchesDir=$1

if [ -f "$maindir/TMP_PATCHES" ]; then
  echo "patches seems to already be applied, skipping"
  exit 0
fi

cd "$patchesDir" || { echo "patchesDir doesnt exists" && exit 1 ; }
find . -type f -name \*.patch | rev | cut -d/ -f2- | rev | uniq | cut -d/ -f2- > "$maindir/TMP_PATCHES"
cd "$maindir"
while read -r pdir; do
  { cd "$pdir" && echo -e "\napplying patches to $pdir\n" ; } || exit 1
  git am "$patchesDir/$pdir"/*.patch || while ! git am --skip ; do : ; done
  cd "$maindir"
done < "$maindir/TMP_PATCHES"

exit 0
