// Squares
for (int i = 0 ; i < nn ; i += n)
    for (int j = 0 ; j < nn ; j += n) {
        IntVar[] square = new IntVar[nn];
        for (int x = 0 ; x < n ; ++x)
            for (int y = 0 ; y < n ; ++y)
                square[n * x + y] = grid[i + x][j + y];
        model.allDifferent(square).post();
    }
