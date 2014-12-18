# synthetic rock-package set for testing clang-based typelib import

Done so far:

Written on debian-jessie-amd64. Developed and mainly tested using the [TransTerrA
package-set](https://git.hb.dfki.de/transterra/package_set). Only
[tools/typelib](https://github.com/jmachowinski/typelib/tree/clang_tlb_import)
and [tools/orogen](https://github.com/marvin2k/orogen/tree/clang_integration)
have changes.

Testing with a synthetic
[package-set](https://github.com/marvin2k/clang-package_set) which contains only
rock-core and the apropriate
[overrides](https://github.com/marvin2k/clang-package_set/blob/master/overrides.yml)
for the yet unmerged development branches of `typelib` and `orogen`.

## bootstrapping:

Get the script from the package-set into clean directory and run bootstrap, as
usual:

```bash
wget https://raw.githubusercontent.com/marvin2k/clang-package_set/master/bootstrap.sh
sh bootstrap.sh
autoproj build
```

# build testing

Done in clean chroots on a debian-jessie-amd64 base-system. Users of other
systems are invited to add their numbers in the following table:

| OS            | ARCH  | status           | bench clang-based              | bench vanilla | user |
|---------------|-------|------------------|--------------------------------|---------------|------|
| debian-jessie | amd64 | works            | User time (seconds): 3389.37   | 3234.58       |  mz  |
| debian-wheezy | amd64 | fails            | only `clang-3.1` -- no support | 2922.48       |  mz  |
| ubuntu-trusty | i386  | works            | User time (seconds): 2440.00   | 2365.67       |  mz  |
| ubuntu-trusty | amd64 | works            | User time (seconds): 2491.83   | 2292.74       |  mz  |

- `jessie` is slower than `trusty` by rather largish amount. possibly because of
  compiling [external/opencv](https://github.com/rock-core/package_set/blob/master/rock.osdeps#L125)
  from source.
- clang-based `typelib` works for compiling, but almost all the numbers go up --
  for example the build-time increases more than two minutes... Why?

## benchmarking:

after a full bootstrap clean existing build-files for timing of full rebuild:

```bash
# `autoproj clean` crashes... *sigh*... well it can't we _that_ hard, roll our own:
cd $AUTOPROJ_CURRENT_ROOT
find . -name build -exec rm -rf {} \;
find . -name .orogen -exec rm -rf {} \;
find . -path .gems -prune -o -name install -exec rm -rf {} \;

/usr/bin/time -v autoproj build
```

## vanilla:

after full bootstrap remove the `overrides.yml`, update, clean and then rebuild:

```bash
cd $AUTOPROJ_CURRENT_ROOT
find . -name build -exec rm -rf {} \;
find . -name .orogen -exec rm -rf {} \;
find . -path .gems -prune -o -name install -exec rm -rf {} \;

cd $AUTOPROJ_CURRENT_ROOT/autoproj
rm overrides.yml
autoproj update typelib orogen
```

# runtime testing

any ideas? Is there some unit-test that launches two deployments to talk to each
other?
