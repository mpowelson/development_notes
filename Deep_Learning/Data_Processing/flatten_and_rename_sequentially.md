# Flatten and Rename Data Sequentially in Bash

This obviously applies to .png files. Change as needed.

[To Flatten](https://unix.stackexchange.com/questions/253938/flattening-complex-folder-structures-with-duplicate-file-names):
```
shopt -s globstar
for i in **/*png; do mv "$i" "${i//\//_}"; done
```

[To Rename Sequentially](https://stackoverflow.com/questions/3211595/renaming-files-in-a-folder-to-sequential-numbers)
```
a=1
for i in *.png; do
  new=$(printf "%04d.png" "$a") #04 pad to length of 4
  mv -i -- "$i" "$new"
  let a=a+1
done
```
