# to do tomorrow: циклы

# AWK - Loops select every 3.
awk 'BEGIN {
for (i = 1; i <= 62; ++i) {
    if (i % 3 == 0) print i ; else continue
    }
}'
#
# косые `кавычки` подставить вывод команды как текст
for i in `seq 1 10` do TMPFILE${i}=$(mktemp) done
