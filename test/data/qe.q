q)2+2           /comment is ' /': left of /: whitespace or nothing
q)2-3           /negative numbers
q)2*3+4         /no precedence, right to left
q)(2*3)+4       /parentheses changes order
q)3%4           /division represented by '%'
q){x*x}4        /square
q)sqrt 4        /square root
q)reciprocal 4  /1/x 
q)2*1 2 3      /numeric list with space separators
q)1 2 3%2 4 6  /list to list operations, same size
q)count 1 2 3  /size of vector
q)3#1          /generate sequence of same numbers
q)5#1 2        /or from a list of given elements
q)first 1 2 3   /first element
q)last 1 2 3    /last element
q)1_1 2 3       /rest without first element
q)-1_1 2 3      /rest without last element
q)reverse 1 2 3   /reverse
q)1 2 3@1       /indexing is zero-based
q)1 2 3@1 0     /index can be vector too
q)til 3        /generate zero-based sequence
q)2 4 6?4      /index of given element(s)
q)iasc 2 1 6   /indices of sorted order
q)asc 2 1 6    /sort vector
q)1 2 3,10 20      /join lists
q)1+2+3            /sum of elements
q)sum 1 2 3        /insert '+' between elements
q)sums 1 2 3       /running sum of elements
q)1,(1+2),(1+2+3)  /same as this
q){1_x+prev x}til 5    /sum running pairs
q)sum each{(2*til ceiling .5*count x)_x}1 2 3 4 5 /non-intersecting pairs
q)(1 2;3 4 6;7 6)     /list
q)first(3 4 6;7 6)    /first item in the list
q){x+x*x}4              /a + a^2
q)(sqrt;{x*x})@\:4      /[sqrt(a), a^2]
q){x*x}sum 2 3          /(a +b)^2
q)sum{x*x}2 3           /a^2 + b^2
q){sum(x*x),2*/x}2 3    /(a + b)^2 = a^2 + b^2 + 2ab
q)sqrt sum{x*x}3 4      /sqrt(a^2 + b^2)
q)d1:-          /dyadic projection
q)d2:{x-y}      /explicit dyad
q)m1:neg        /monadic projection
q)m2:0-         /monadic projection
q)m3:{neg x}    /explicit monad
q)(m1;m2;m3)@\:4     / monads
q)(d1;d2).\:3 4      / dyads
q)(e;2*e;e*e:exp 1)   /e, 2e, e squared
q)exp 2               /exponent, e^2
q)2 xexp 16           /exponent base 2, 2^16
q)log exp 2           /logarithm, ln e^2
q)2 xlog 65536        /logarithm base 2, log2 65536
q)a:(pi;2*pi;pi*pi:acos -1) /pi, 2 pi, pi squared
q)cos pi                    /cosine of pi
q)(t:sum{x*x}@(cos;sin)@\:)pi   /theorem of trigonometry
q)t a                           /test theorem at angles
q)1 2 3*/:1 2 3     /outer product: multiplication table
q){x=/:x}@key 3     /identity matrix
q)2 3#key 6         /generate matrix
q)2 2#0 1 1 1       /reshape given vector to matrix
q)raze/[N:0 3_/:2 6#key 12]         /ravel: list of atoms
q)raze each N                       /ravel each sub-matrix
q)M:3 3#"ABC123!@#" /character matrix
q)M ./:/:f value group sum each f:n cross n:til 3    /secondary diagonals
q)M ./:a,'a:key count M /main diagonal
q)N:((0 1 2;3 4 5);(6 7 8;9 10 11))
q)((N 1) 1) 1 /repetitive selection of items From list
q)3@[;1]/N    /apply select 3 times
q)N[1;1;1]    /cross sectional select
q)N . 1 1 1   /cross sectional select too
q)each[f:{$[x<0;0;prd 1.+til x]}]1+til 5 /factorial
q)prds 1+til 5                      /running product
q)(b:{til[x]{$[x<y;0;floor f[x]%f[y]*f x-y]}\:/:til x})5 /binomial coeff.
q)1_{sum b[x]./:flip(til x;reverse key x)}each til 16 /fibonacci: sum of second diagonal of binomial matrix
q)1 2 3 wsum 1 2 3       /dot product wsum=+/* (optimized)
q)1 2 3.$1 2 3.	       /also
q)M:(0 1.;1 1.)          /assignment
q)M$M                    /matrix squared (optimized)
q)15$[M]/M               /matrix to the power of 15, also fibonacci
q)(14$[M]\M)[;0;1]
q)A:5?1.;A                  /5 random floats from 0..1
q)B:10?2;B                  /coin toss
q)B1:10?0b;B1		  /with booleans
q)C:-3?3;C                /deal 3 out of 3 cards in certain order
q)(min;max)@\:A           /min and max over the list
q)B?0                     /first zero
q)avg C~/:1_10000{-3?3}\() /method monte carlo
q)reciprocal f 3           /exact probability of 3 cards in given order
q)D:distinct S:"mississippi" /distinct items
q)K:D?S;K                        /find (?) indexes
q)S value group K                /group by key
q)count each group S             /frequencies
q)I:(key count S)in first each group S;S      /sieve of nub
q)S where I                 /filter by sieve to get D
q)sum D=/:S                 /where items of D are in S
