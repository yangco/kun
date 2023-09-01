
tests:flip `a`b!("**";",") 0: `:tests.csv
{.Q.s1 eval parse x`a} each tests

/{$[min (.Q.s1 eval parse x`b) = x`c;:(x`b)," OK!";:(x`b)," ERROR!"]} each tests

/ t:("***";",") 0: `:cases.csv
/ i:0;
/ while[ i < count t[1]; 
/     a : .Q.s1 eval parse t[1][i];
/     if [ max a <> t[2][i]; 
/         show "[", t[0][i], "] ", t[1][i];
/     ];
/     i+:1;
/   ]