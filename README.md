# synthetic rock-package set for testing clang-based typelib import

Done so far:

Developed and written using Debian Jessie and the TransTerrA package-set [1].
Only `tools/typelib` and `tools/orogen` have changes. The modified source-code
resides on GitHub in [2] and [3].

Testing with a synthetic package-set [4] which contains only rock-core and the
apropriate overrides for the unmerged development branches in `typelib` and
`orogen`.

[1] https://git.hb.dfki.de/transterra/package_set
[2] https://github.com/jmachowinski/typelib/tree/clang_tlb_import
[3] https://github.com/marvin2k/orogen/tree/clang_integration
[4] https://github.com/marvin2k/clang-package_set

# build testing

All done in clean chroots on Jessie base-system.

| OS | ARCH | status |
|----|------|--------|
| debian-jessie | amd64 | worked |
| debian-wheezy | amd64 | most recent system package: clang3.1 |
| ubuntu-trusty | amd64 | worked |
| ubuntu-trusty | i386  | worked |

benchmarking:

```bash
# autoproj clean crashes... *sigh*... well can't be that hard, roll your own:
find . -path ".*" -prune -o -name .orogen -or -name build -or -name install -exec rm -rf {} \;
/usr/bin/time -v autoproj build
```


# runtime testing

Well... ideas?
