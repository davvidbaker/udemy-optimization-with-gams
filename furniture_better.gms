* Defining sets
set i "product type" 
    / desks, tables, chairs /;

parameters
l(i) "lumber [ft]" 
/
desks 8,
tables 6,
chairs 1
/,

f(i) "finishing hours" 
/
desks 4,
tables 2,
chairs 1.5
/

c(i) "carpentry hours" 
/ 
desks 2, 
tables 1.5,
chairs 0.5
/

p(i) "price of selling"
/
desks 60,
tables 30,
chairs 20
/;

* Decision Variables
variable OF "objective function";
positive variable x(i) "decision variable";

equations obj,const1,const2,const3,const4;

obj.. OF =e= sum(i, p(i) * x(i));

const1.. sum(i, l(i) * x(i)) =l= 48;

const2.. sum(i, f(i) * x(i)) =l= 20;

const3.. sum(i, c(i) * x(i)) =l= 8;

const4.. x("tables") =l= 5;

model s4problem2 /all/;

solve s4problem2 using LP maximize OF;


* * start by defining the objective function (as a variable)
* Variable
* OF Objective Variable;

* Positive Variables
* desks Number of desks
* tables Number of tables
* chairs Number of chairs;


* * Define equations

* Equations 
* Obj_revenue,Const_tables, Const_lumber, Const_finishing_hours, Const_carpentry_hours;


* * Define objective function
* Obj_revenue.. OF =e= 60*desks + 30*tables + 20*chairs;

* *Constraints
* Const_tables.. tables =l= 5;
* Const_lumber.. 8*desks + 6*tables + 1*chairs =l= 48;
* Const_finishing_hours.. 4*desks + 2*tables + 1.5*chairs =l=20;
* Const_carpentry_hours.. 2*desks + 1.5*tables + 0.5*chairs =l=8;

* *Solving Stage
* model Problem2 /all/;

* Solve Problem2 using LP maximizing OF;