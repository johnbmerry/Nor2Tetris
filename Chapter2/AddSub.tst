load AddSub.hdl,
output-file AddSub.out,
compare-to AddSub.cmp,
output-list a%B1.4.1 b%B1.4.1 sel%B2.1.2 out%B1.4.1 c%B3.1.3;

//TODO: add more cases for adding (a+b) or subtracting (a-b) negative number(s)
set a %B0001,
set b %B0001,
set sel 0,
eval,
output;

set a %B0001,
set b %B0001,
set sel 1,
eval,
output;

set a %B0111,
set b %B0001,
set sel 0,
eval,
output;

set a %B0111,
set b %B0001,
set sel 1,
eval,
output;

set a %B0111,
set b %B0101,
set sel 0,
eval,
output;

set a %B1111,
set b %B1101,
set sel 0,
eval,
output;

set a %B1111,
set b %B1001,
set sel 1,
eval,
output;

set a %B0110,
set b %B1100,
set sel 1,
eval,
output;

set a %B1111,
set b %B1000,
set sel 0,
eval,
output;