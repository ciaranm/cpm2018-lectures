if (model.getSolver().solve()) {
    for (int i = 0 ; i < nn ; i++) {
        for (int j = 0 ; j < nn ; j++)
            System.out.print(grid[i][j].getValue() + " ");
        System.out.println();
    }
}

System.out.println("\n" + model.getSolver().getMeasures());
