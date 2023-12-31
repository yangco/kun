/
Q by EXAMPLE
  kdb+/q  is product of Kx Inc.  http://kx.com
  based on J by EXAMPLE by 06/11/2005 (C) Oleg Kobchenko     http://olegykj.sourceforge.net
\

/simple arithmetic ===============================================

q)2+2           /comment is ' /': left of /: whitespace or nothing
4

q)2-3           /negative numbers
-1

q)2*3+4         /no precedence, right to left
14

q)(2*3)+4       /parentheses changes order
10

q)3%4           /division represented by '%'
0.75

q){x*x}4        /square
16

q)sqrt 4        /square root
2.0

q)reciprocal 4  /1/x 
0.25

/operations using lists ==========================================

q)2*1 2 3      /numeric list with space separators
2 4 6

q)1 2 3%2 4 6  /list to list operations, same size
0.5 0.5 0.5

q)count 1 2 3  /size of vector
3

q)3#1          /generate sequence of same numbers
1 1 1

q)5#1 2        /or from a list of given elements
1 2 1 2 1

/ list elements ===================================================

q)first 1 2 3   /first element
1

q)last 1 2 3    /last element
3

q)1_1 2 3       /rest without first element
2 3

q)-1_1 2 3      /rest without last element
1 2

q)reverse 1 2 3   /reverse
3 2 1

/ indexing and sorting ============================================

q)1 2 3@1       /indexing is zero-based
2

q)1 2 3@1 0     /index can be vector too
2 1

q)til 3        /generate zero-based sequence
0 1 2

q)2 4 6?4      /index of given element(s)
1

q)iasc 2 1 6   /indices of sorted order
1 0 2

q)asc 2 1 6    /sort vector
`s#1 2 6

/ list aggregation ================================================

q)1 2 3,10 20      /join lists
1 2 3 10 20

q)1+2+3            /sum of elements
6

q)sum 1 2 3        /insert '+' between elements
6

q)sums 1 2 3       /running sum of elements
1 3 6

q)1,(1+2),(1+2+3)  /same as this
1 3 6

q){1_x+prev x}til 5    /sum running pairs
3 5 7 9

q)sum each{(2*til ceiling .5*count x)_x}1 2 3 4 5 /non-intersecting pairs
3 7 5

q)(1 2;3 4 6;7 6)     /list
(1 2;3 4 6;7 6)

q)first(3 4 6;7 6)    /first item in the list
3 4 6

/ function combinations ===========================================

q){x+x*x}4              /a + a^2
20

q)(sqrt;{x*x})@\:4      /[sqrt(a), a^2]
(2f;16)

q){x*x}sum 2 3          /(a +b)^2
25

q)sum{x*x}2 3           /a^2 + b^2
13

q){sum(x*x),2*/x}2 3    /(a + b)^2 = a^2 + b^2 + 2ab
25

q)sqrt sum{x*x}3 4      /sqrt(a^2 + b^2)
5f

/ user defined functions and arguments ============================

q)d1:-          /dyadic projection
q)d2:{x-y}      /explicit dyad
q)m1:neg        /monadic projection
q)m2:0-         /monadic projection
q)m3:{neg x}    /explicit monad

q)(m1;m2;m3)@\:4     / monads
-4 -4 -4

q)(d1;d2).\:3 4      / dyads
-1 -1

/ exponent and logarithm ==========================================

q)(e;2*e;e*e:exp 1)   /e, 2e, e squared
2.718282 5.436564 7.389056

q)exp 2               /exponent, e^2
7.389056

q)2 xexp 16           /exponent base 2, 2^16
65536.0

q)log exp 2           /logarithm, ln e^2
2.0

q)2 xlog 65536        /logarithm base 2, log2 65536
16.0

/ trigonometry ====================================================

q)a:(pi;2*pi;pi*pi:acos -1) /pi, 2 pi, pi squared
3.141593 6.283185 9.869604

q)cos pi                    /cosine of pi
-1.0

q)(t:sum{x*x}@(cos;sin)@\:)pi   /theorem of trigonometry
1.0

q)t a                           /test theorem at angles
1 1 1.0

/ matrices ========================================================

q)1 2 3*/:1 2 3     /outer product: multiplication table
(1 2 3;2 4 6;3 6 9)

q){x=/:x}@key 3     /identity matrix
(100b;010b;001b)

q)2 3#key 6         /generate matrix
(0 1 2;3 4 5)

q)2 2#0 1 1 1       /reshape given vector to matrix
(0 1;1 1)

/ structural transforms ===========================================

q)raze/[N:0 3_/:2 6#key 12]         /ravel: list of atoms
0 1 2 3 4 5 6 7 8 9 10 11

q)raze each N                       /ravel each sub-matrix
(0 1 2 3 4 5;6 7 8 9 10 11)

q)M:3 3#"ABC123!@#" /character matrix
(::;flip;reverse;reverse each;1 rotate)@\:M
(("ABC";"123";"!@#");("A1!";"B2@";"C3#");("!@#";"123";"ABC");("CBA";"321";"#@!");("123";"!@#";"ABC"))

q)M ./:/:f value group sum each f:n cross n:til 3    /secondary diagonals
(enlist"A";"B1";"C2!";"3@";enlist"#")

q)M ./:a,'a:key count M /main diagonal
"A2#"

/ selection ======================================================
q)N:((0 1 2;3 4 5);(6 7 8;9 10 11))
q)((N 1) 1) 1 /repetitive selection of items From list
10

q)3@[;1]/N    /apply select 3 times
10

q)N[1;1;1]    /cross sectional select
10

q)N . 1 1 1   /cross sectional select too
10

/ factorial and binomial ==========================================

q)each[f:{$[x<0;0;prd 1.+til x]}]1+til 5 /factorial
1 2 6 24 120.0

q)prds 1+til 5                      /running product
1 2 6 24 120

q)(b:{til[x]{$[x<y;0;floor f[x]%f[y]*f x-y]}\:/:til x})5 /binomial coeff.
(1 1 1 1 1;0 1 2 3 4;0 0 1 3 6;0 0 0 1 4;0 0 0 0 1)

q)1_{sum b[x]./:flip(til x;reverse key x)}each til 16 /fibonacci: sum of second diagonal of binomial matrix
1 1 2 3 5 8 13 21 34 55 89 144 233 377 610

/ dot product =====================================================

q)1 2 3 wsum 1 2 3       /dot product wsum=+/* (optimized)
14f

q)1 2 3.$1 2 3.	       /also
14f

q)M:(0 1.;1 1.)          /assignment
q)M$M                    /matrix squared (optimized)
(1 1.;1 2.)

q)15$[M]/M               /matrix to the power of 15, also fibonacci
(610 987.;987 1597.)

q)(14$[M]\M)[;0;1]
1 1 2 3 5 8 13 21 34 55 89 144 233 377 610f

/ randomness and probability ======================================

q)A:5?1.;A                  /5 random floats from 0..1
0.03505812 0.7834427 0.7999031 0.9046515 0.2232866

q)B:10?2;B                  /coin toss
1 1 1 0 1 0 1 1 0 0

q)B1:10?0b;B1		  /with booleans
11110010101b

q)C:-3?3;C                /deal 3 out of 3 cards in certain order
1 0 2

q)(min;max)@\:A           /min and max over the list
0.03505812 0.9046515

q)B?0                     /first zero
3

q)avg C~/:1_10000{-3?3}\() /method monte carlo
0.1643836

q)reciprocal f 3           /exact probability of 3 cards in given order
0.1666667

/ unique elements =================================================

q)D:distinct S:"mississippi" /distinct items
"misp"

q)K:D?S;K                        /find (?) indexes
0 1 2 2 1 2 2 1 3 3 1

q)S value group K                /group by key
(enlist"m";"iiii";"ssss";"pp")

q)count each group S             /frequencies
"misp"!1 4 4 2

q)I:(key count S)in first each group S;S      /sieve of nub
11100000100b 				    /where D is in S

q)S where I                 /filter by sieve to get D
"misp"

q)sum D=/:S                 /where items of D are in S
1 4 4 2
