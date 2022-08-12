
function Recessions = getEArecession()

wo = weboptions ;
wo.Timeout = 30 ;

getHTML  = webread('https://eabcn.org/dc/recession-indicators') ;
readHTML = htmlTree(getHTML) ;

subtree1 =  findElement(readHTML, "A") ;
subtree2 = getAttribute(subtree1, "href") ;

getlink  = subtree2(contains(subtree2, 'cepr_recession_indicator')) ;

ceprdates = webread(getlink) ;

dates = ceprdates.Dates ;
recid = logical(ceprdates.PeakExcluded) ;

q2m = @(x) 1*(x == 0) + 4*(x == .25) + 7*(x == .5) + 10*(x == .75) ; 

y1 = fix(dates(1)) ;
m1 = q2m(mod(dates(1), 1)) ;

yT = fix(dates(end)) ;
mT = q2m(mod(dates(end), 1)) ;

t = (datetime(y1, m1, 1) : calquarters(1) : datetime(yT, mT, 1))' ;
numrec(recid, 1) = datenum(t(recid)) ;

p = find(numrec ~= 0) ;
D = numrec(numrec ~= 0) ;

p2 = find(diff(p) ~= 1) ;

P1 = D([1 p2' + 1]) ;
P2 = D([p2' end]) ;
 
C = zeros(size(P1, 1), 2) ;
C(:, 1) = P1 ;
C(:, 2) = P2 ;

Recessions = C ;



