Model model = new Model("one row sudoku");
Solver solver = model.getSolver();
IntVar[] row = new IntVar[9];
row[0] = model.intVar(new int[]{1,8});
row[1] = model.intVar(new int[]{2,3});
row[2] = model.intVar(new int[]{2,3});
row[3] = model.intVar(new int[]{2,4,5});
row[4] = model.intVar(new int[]{4,5,6});
row[5] = model.intVar(new int[]{4,5,6});
row[6] = model.intVar(new int[]{2,7,9});
row[7] = model.intVar(new int[]{3,7,8});
row[8] = model.intVar(new int[]{2,3,5,8,9});
System.out.println("Before: " + Arrays.toString(row));

model.allDifferent(row).post();
solver.propagate();
System.out.println("After: " + Arrays.toString(row));
