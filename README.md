# append_test_pl

Path::Tinyの`opena({locked => 1})`の動きを確認する。

```
my $wfh = path("log.txt")->opena_utf8({locked => $locked});
```


`gmake --jobs` として並列実行した際に、出力ファイルが壊れないかを確認する。  
確認は、`perl check.pl`でdieしないかどうかで確認。

環境変数`APPEND_TEST_LOCKED`が1の時はlocked => 1、0の時はlocked => 0となるようにしています。

## 壊れないパターン1

1CPUでの実行のため、壊れない。

```
set APPEND_TEST_LOCKED=0
gmake
```

## 壊れないパターン2

locked => 1のため、壊れない。

```
set APPEND_TEST_LOCKED=1
gmake --jobs
```

## 壊れるパターン

locked => 0のため、壊れる。

```
set APPEND_TEST_LOCKED=0
gmake --jobs
```
