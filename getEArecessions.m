function Recessions = getEArecessions()
% The function retrieves the most recent EABCN recession announcement and
% computes the relavitve datenum values. 
%                     
%                 ** Requires a network connection. **
%
% Output: Recessions - Rx2 matrix of datenum values. The first column
%           contains the start dates of the recessions and the last
%           column the relative end date.
%
% To plot recession bands for the Euro Area, use:
% recessionplot('Recessions', getEArecessions)
%                   or
% EArec = getEArecessions ;
% recessionplot('Recessions', EArec)
%
% Andrea De Polis, 2022 (a.de-polis@warwick.ac.uk)

wo = weboptions ;
wo.Timeout = 30 ;

getHTML  = webread('https://eabcn.org/dbc/peaksandtroughs/chronology-euro-area-business-cycles') ;
readHTML = htmlTree(getHTML) ;

subtree1 =  findElement(readHTML, "A") ;
subtree2 = getAttribute(subtree1, "href") ;

getlink  = subtree2(contains(subtree2, 'cepr_recession_indicator', 'IgnoreCase', true)) ;
recdates = webread(getlink) ;

dates = recdates.Dates ;
recid = logical(recdates.PeakExcluded) ;

q2m = @(x) 3*(x == 0) + 6*(x == .25) + 9*(x == .5) + 12*(x == .75) ;

yr = fix(dates) ;
mt = q2m(mod(dates, 1)) ;
t  = datetime(yr, mt, 1) ;

numrec(recid) = datenum(t(recid)) ;

p =   find(numrec ~= 0) ;
D = numrec(numrec ~= 0) ;

p2 = find(diff(p) ~= 1) ;

Recessions(:, 1) = D([1 p2+1]) ;
Recessions(:, 2) = D([p2 end]) ;

