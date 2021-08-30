# Grep for more than one line in a file

e.g. I want to find how many files have both `"key1": True` and `"key2": False`. 


```
grep -rlZ "\"key1\": True" | xargs -0 grep -lr "\"key2\": False" | wc -l
```
