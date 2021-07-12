# Julia Support at NERSC

## Download

Run:
```bash
./download_julia.sh $MAJOR_VERSION $MINOR_VERSION
```

Eg. for `1.6.0` run: `./download_julia.sh 1.6 0`

## Unpack

Run:
```bash
./unpack_julia.sh $VERSION_NUMBER
```

Eg. for `1.6.0` run: `./unpack_julia.sh 1.6.0`

## Generate Test Module

Run:
```bash
./modulefiles/julia/mk_test.sh
```

You can then use the `$VERSION_NUMBER-test` Julia modules by running:
```bash
module use $(pwd)/modulefiles
```

## Chmod

Run:
```bash
./update_chmod.sh $VERSION_NUMBER
```

Eg. for `1.6.0` run: `./update_chmod.sh 1.6.0`
