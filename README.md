# Version 2 (2017)
- Based on the modularized version
- Rebuild with array indexing in fortran standard (1-indexes whenever possible)
- Objectoriented Architecture
- JSON Files for configuration

## Compile Simstrat

**System Requirements**

- [Python](https://www.python.org/) 2.7 or later
- [FoBiS.py](https://github.com/szaghi/FoBiS) 2.2.6 or later (available via GitHub or pip)
- [Intel Fortran (Intel Parallel Studio XE 2016)](https://software.intel.com/en-us/parallel-studio-xe/choose-download) or gfortran 6.3 or later


**Building Simstrat v2.0 with FoBiS.py**

From version 2.0 onwards, [FoBiS.py](https://github.com/szaghi/FoBiS) is used as an automated build-system. The FoBiS.py python-package is available on pip:

```
pip install FoBiS.py
```

To compile simstrat 2.0 (beta) navigate to the Simstrat_v2 folder of the repository and run the following command:

- Using Gnu Fortran Compiler

  ```
  FoBiS.py build -mode release-gnu
  ```

- Using Intel Fortran Compiler (run the command in the parallel studio CMD!)

  ```
  FoBiS.py build -mode release-intel
  ```