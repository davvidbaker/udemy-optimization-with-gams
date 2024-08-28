* Defining variables

* start by defining the objective function (as a variable)
Variable
OF Objective Variable;

Positive Variables
desks Number of desks
tables Number of tables
chairs Number of chairs;


* Define equations

Equations 
Obj_revenue,Const_tables, Const_lumber, Const_finishing_hours, Const_carpentry_hours;


* Define objective function
Obj_revenue.. OF =e= 60*desks + 30*tables + 20*chairs;

*Constraints
Const_tables.. tables =l= 5;
Const_lumber.. 8*desks + 6*tables + 1*chairs =l= 48;
Const_finishing_hours.. 4*desks + 2*tables + 1.5*chairs =l=20;
Const_carpentry_hours.. 2*desks + 1.5*tables + 0.5*chairs =l=8;

*Solving Stage
model Problem2 /all/;

Solve Problem2 using LP maximizing OF;