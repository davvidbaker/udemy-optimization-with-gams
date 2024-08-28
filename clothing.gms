set i "items produced" 
    /shirts, shorts, pants/;

parameters
    p(i) "sales price [$]"
    /
    shirts 12,
    shorts 8,
    pants 15
    /,

    co(i) "cost to produce item i [$]"
    /
    shirts 6,
    shorts 4,
    pants 8
    /,

    l(i) "labor to produce item i [hours]"    
    /
    shirts 3,
    shorts 2,
    pants 6
    /,

    cl(i) "cloth to produce item i [sq yards]"
    /
    shirts 4,
    shorts 3,
    pants 4
    /,

    f(i) "fixed cost to rent machine [$]"
    /
    shirts 200,
    shorts 150,
    pants 100
    /,
    
    M(i) "big M value"
    /
    shirts 40,
    shorts 53,
    pants 25
    /
    /;

variables 
    z "objective function";

integer variable
    x(i) "number of item i produced";

binary variable
    y(i) "whether item i is produced at all or not";

equations 
    objfn "calc of our minimization target"
    labor_constraint
    cloth_constraint
    const3
    ;

objfn.. z =e= sum(i, p(i) * x(i)) - sum(i, co(i) * x(i)) - sum(i, f(i) * y(i));

labor_constraint.. sum(i, l(i) * x(i)) =l= 150;
cloth_constraint.. sum(i, l(i) * cl(i)) =l= 160;

const3 .. x(i) =l= M(i) * y(i);