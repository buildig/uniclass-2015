## How to use convert.sh

1. Update Uniclass [file version numbers](/util/convert.sh#L7-L17) to the [latest](https://toolkit.thenbs.com/articles/classification#classificationtables)
2. Run this script (requires [in2csv](http://csvkit.readthedocs.io/en/1.0.2/scripts/in2csv.html)):

```
php -r "readfile('https://raw.githubusercontent.com/buildig/uniclass-2015/master/util/convert.sh');"
> convert.sh
chmod a+x convert.sh
./convert.sh
```
