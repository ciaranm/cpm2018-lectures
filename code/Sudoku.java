/* vim: set sw=4 sts=4 et foldmethod=syntax : */

import java.util.Arrays;
import java.util.stream.IntStream;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;

import org.chocosolver.solver.Model;
import org.chocosolver.solver.Solver;
import org.chocosolver.solver.variables.IntVar;
import org.chocosolver.solver.constraints.IIntConstraintFactory.*;
import org.chocosolver.solver.search.strategy.Search;
import org.chocosolver.solver.exception.ContradictionException;

public class Sudoku
{
    private static void alldiff(Model model, IntVar[] array, boolean decompose)
    {
        if (decompose) {
            for (int i = 0 ; i < array.length - 1 ; ++i)
                for (int j = i + 1 ; j < array.length ; ++j)
                    model.arithm(array[i], "!=", array[j]).post();
        }
        else
            model.allDifferent(array).post();
    }

    public static void main(String args[]) throws ContradictionException, FileNotFoundException
    {
        int n = args.length > 2 ? Integer.parseInt(args[2]) : 3;
        int nn = n * n;
        int[][] predef = new int[nn][nn];

        boolean decompose = args.length > 1 && args[1].equals("neq");

        try (Scanner sc = new Scanner(new File(args[0]))) {
            for (int i = 0 ; i < nn ; i++)
                for (int j = 0 ; j < nn ; j++)
                    predef[i][j] = sc.nextInt();
        }

        Model model = new Model("Sudoku");

        model.getSolver().limitTime("1h");

        IntVar[][] grid = model.intVarMatrix("grid", nn, nn, 1, nn);

        // Rows
        for (int i = 0 ; i < nn ; ++i)
            alldiff(model, grid[i], decompose);

        // Columns
        for (int i = 0 ; i < nn ; ++i) {
            IntVar[] column = new IntVar[nn];
            for (int j = 0 ; j < nn ; ++j)
                column[j] = grid[j][i];
            alldiff(model, column, decompose);
        }

        // Squares
        for (int i = 0 ; i < nn ; i += n)
            for (int j = 0 ; j < nn ; j += n) {
                IntVar[] square = new IntVar[nn];
                for (int x = 0 ; x < n ; ++x)
                    for (int y = 0 ; y < n ; ++y)
                        square[n * x + y] = grid[i + x][j + y];
                alldiff(model, square, decompose);
            }

        // Predefined values
        for (int i = 0 ; i < nn ; i++)
            for (int j = 0 ; j < nn ; j++)
                if (0 != predef[i][j])
                    model.arithm(grid[i][j], "=", predef[i][j]).post();

        if (model.getSolver().solve()) {
            for (int i = 0 ; i < nn ; i++) {
                for (int j = 0 ; j < nn ; j++)
                    System.out.print(grid[i][j].getValue() + " ");
                System.out.println();
            }
        }

        System.out.println("\n" + model.getSolver().getMeasures());
    }
}
