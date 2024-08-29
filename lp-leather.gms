* Defining variables

* start by defining the objective function (as a variable)
Variable
OF Objective Variable;

Positive Variables
x1 Number of deluxe belts
x2 Number of regular belts;

* Define equations

Equations Revenue,Const1,Const2;


* Define objective function
Revenue.. OF =e= 4*x1 + 3*x2;

*Constraints
Const1.. x1+x2 =l= 40;
Const2.. 2*x1 + x2 =l= 60;

*Solving Stage
model Problem1 /all/;

Solve Problem1 using LP maximizing OF;