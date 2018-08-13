## Exercises
Convert the following decimal numbers to their binary equivalent number using the approach we learned [here](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/04-cs-fundamentals/classroom/Essential%20Mathematics.md#converting-from-decimal-to-binary).
1. 49
1. 234
1. 432

## Solutions
49<sub>10</sub> is less than all powers of 2 greater than 32. So, we start with subtracting 32 from 49.
```
   49
 - 32
 -----
   17
 - 16
 -----
    1
  - 1
 -----
    0
```

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  0  |   0 |  0 |  1 |  1 | 0 | 0 | 0 | 1
 
The binary equivalent of **49**<sub>10</sub> is **110001**<sub>2</sub>.

234<sub>10</sub>
```
  234
 -128
 -----
  106
 - 64
 -----
   42
 - 32
 -----
   10
  - 8
 -----
    2
  - 2
 -----
    0
```

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  0  |   1 |  1 |  1 |  0 | 1 | 0 | 1 | 0
 
The binary equivalent of **234**<sub>10</sub> is **11101010**<sub>2</sub>.

432<sub>10</sub>
```
  432
 -256
 -----
  176
- 128
 -----
   48
 - 32
 -----
   16
 - 16
 -----
    0
```

2<sup>9</sup> | 2<sup>8</sup> | 2<sup>7</sup> | 2<sup>6</sup> | 2<sup>5</sup> | 2<sup>4</sup> | 2<sup>3</sup> | 2<sup>2</sup> | 2<sup>1</sup> | 2<sup>0</sup>
----|-----|-----|----|----|----|---|---|---|---
512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
 0  |  1  |   1 |  0 |  1 |  1 | 0 | 0 | 0 | 0
 
The binary equivalent of **432**<sub>10</sub> is **110110000**<sub>2</sub>.
