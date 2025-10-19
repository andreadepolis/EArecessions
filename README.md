# getEArecessions.m
Matlab&reg; code to obtain Euro Area recession quarters as declared by the [_Euro Area Business Cycle Network_](https://eabcn.org/) (EABCN). 
The function retrieves the most recent EABCN release and outputs a matrix of `datenum` values, with the first (second) column containing the beginning (end) of the recessions.

To plot recession bands for the Euro Area use: 
```matlab

recessionplot('Recessions', getEArecessions)
```
or
```matlab
EArec = getEArecessions ;
recessionplot('Recessions', EArec) 
```
provided the _x-axis_ of the current figure is of `datetime` type.

*Note:* requires a network connection.

<sub>Thanks to Anastasia Allayioti (ECB) for suggeting changes to improve the functionality.</sub>



