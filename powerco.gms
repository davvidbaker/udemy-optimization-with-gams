* Defining sets
sets 
    i "plants" /plant1, plant2, plant3/
    j "cities" /city1, city2, city3, city4/;

parameters
    capacity(i) "capacity of plant in million kWh" 
    /
    plant1 35,
    plant2 50,
    plant3 40
    /,

    demand(j) "demand at city in kwh"
    /
    city1 45,
    city2 20,
    city3 30,
    city4 30
    /;

table cost(i,j) "cost to send 1 million kwh from plant to city"
                city1   city2   city3   city4
    plant1      8       6       10      9
    plant2      9       12      13      7
    plant3      14      9       16      5   ;

* Decision Variables
variable z "total cost [$]";
positive variable x(i, j) "amount of electricity sent from plant i to city j [MM kWh]";

equations 
    obj, 
    demand_constraint(j) "meet demand at city j",
    supply(i) "supply at plant i";

obj.. z =e= sum((i,j), cost(i,j) * x(i, j));

demand_constraint(j).. sum(i, x(i, j)) =e= demand(j);

supply(i).. sum(j, x(i, j)) =e= capacity(i);

model powerco /all/;

solve powerco using LP minimize z;

display x.l, x.m;
