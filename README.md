README
================

## Exploring Election and Census Highly Informative Data Nationally for Indonesia ( Eechidna R package)

The R package *indoelectdata* provides data from Indonesia election. the
election data from the 2014 Legislative election including census data
from the Indonesian Statistics office, and tweets data from twitter.

## How to install

You can install the latest release of the package from CRAN like this

``` r
install.packages("indoelectdata")
```

Or you can install the development version from github, which may have
some changes that are not yet on CRAN, using `devtools`, like this:

``` r
devtools::install_github("FahroziFahrozi/indoelectdata", 
                         build_vignettes = TRUE)
```

If you are using Linux, you may need some additional libraries for the
mapping functions, you can get these with this line:

    apt-get install libgdal-dev libgeos-dev -y

## License

This package is free and open source software, licensed under GNU Affero
General Public License v3.0

## Feedback, contributing, etc.

Please open an issue if you find something that doesn’t work as expected
or have questions or suggestions. Note that this project is released
with a [Guide to Contributing](CONTRIBUTING.md) and a [Contributor Code
of Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.

## Acknowledgements

Thanks to Ben Marwick and Jeremy Forbes for their
[cartogram](https://github.com/ropenscilabs/eechidna) package which
supplies the examples for this package.
