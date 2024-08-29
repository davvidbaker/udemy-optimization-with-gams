set 
    i "production lines" /pl1, pl2/
    j "seat types" /type1*type3/
;

table S(i,j) "seats"
            type1   type2   type3
    pl1     20      30      40
    pl2     50      35      45
;

parameters 
    pc(i) "production cost [$]" /pl1 1000, pl2 2000/
    sa(i) "salary [$]"          /pl1  400, pl2 600/;

variable z "objective function";

integer variable x(i) "number of workers employed in line i";

binary variable y(i) "if line i is used";

equations objfn, const1(j), const2(j), const3(j), const4(i);

objfn.. z =e= sum(i, pc(i) * y(i)) + sum(i, sa(i) * x(i));

const1(j).. sum(i, S(i,"type1") * x(i)) =g= 120;
const2(j).. sum(i, S(i,"type2") * x(i)) =g= 150;
const3(j).. sum(i, S(i,"type3") * x(i)) =g= 200;

const4(i).. x(i) =l= 30 * y(i);

model automobiles /all/;

solve automobiles using MIP minimizing z;

execute_unload 'autos.gdx' ; 