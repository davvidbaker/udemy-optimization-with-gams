$Title Traveling Salesman Problem

set i "cities" /city1*city5/;

alias(i,j);

table d(i,j) "distances [miles]"
            city1   city2   city3   city4   city5
    city1   0       132     217     164     58
    city2   132     0       290     201     79
    city3   217     290     0       113     303
    city4   154     201     113     0       196
    city5   58      79      303     196     0
;

binary variable x(i,j) "1 if salesman goes from city i to j, 0 otherwise";

variable z "total distance traveled";

equations 
    objfn
    from_all_cities_constraint(i)
    to_all_cities_constraint(j)
    no_subtours(i,j)
    ;

objfn.. z =e= sum((i,j), d(i,j) * x(i,j));

from_all_cities_constraint(i).. sum(j, x(i,j)) =e= 1;
to_all_cities_constraint(j).. sum(i, x(i,j)) =e= 1;
no_subtours(i,j).. x(i,j) + x(j,i) =l= 1;

model tsp /all/;

solve tsp using MIP minimizing z;

execute_unload 'tsp.gdx' ; 