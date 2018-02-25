Model model = new Model("Sudoku");
IntVar[][] grid = model.intVarMatrix("grid", nn, nn, 1, nn);
