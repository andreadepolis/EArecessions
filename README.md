# getEArecessions.m
Matlab&reg; code to obtain Euro Area recession quarters as declared by the [_Euro Area Business Cycle Network_](https://eabcn.org/) (EABCN). 
The function retrieves the most recent EABCN release and outputs a $T\times2$ matrix of `datenum` values, with the first (second) column containing the beginning (end) of the recessions.

Use `recessionplot('Recessions', getEArecessions)` to plot recession bands for the Euro Area (provided the _x-axis_ of the current figure is of `datetime` type.
