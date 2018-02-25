include "globals.mzn";

array[1..9] of var 1..9: row;
constraint row[1] in { 1, 8 };
constraint row[2] in { 2, 3 };
constraint row[3] in { 2, 3 };
constraint row[4] in { 2, 4, 5 };
constraint row[5] in { 4, 5, 6 };
constraint row[6] in { 4, 5, 6 };
constraint row[7] in { 2, 7, 9 };
constraint row[8] in { 3, 7, 8 };
constraint row[9] in { 2, 3, 5, 8, 9 };

constraint alldifferent(row);

solve satisfy;
