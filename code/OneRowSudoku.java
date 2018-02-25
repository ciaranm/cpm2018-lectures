/* vim: set sw=4 sts=4 et foldmethod=syntax : */

import java.util.Arrays;

import org.chocosolver.solver.Model;
import org.chocosolver.solver.Solver;
import org.chocosolver.solver.variables.IntVar;
import org.chocosolver.solver.constraints.IIntConstraintFactory.*;
import org.chocosolver.solver.search.strategy.Search;
import org.chocosolver.solver.exception.ContradictionException;

public class OneRowSudoku
{
    public static void main(String args[]) throws ContradictionException
    {
        Model model   = new Model("one row sudoku");
        Solver solver = model.getSolver();

        IntVar[] row =  new IntVar[9];

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

        if (args.length > 0 && args[0].equals("neq"))
            for (int i=0;i<8;i++)
                for (int j=i+1;j<9;j++)
                    model.arithm(row[i],"!=",row[j]).post();
        else
            model.allDifferent(row).post();

        solver.propagate();

        System.out.println("After: " + Arrays.toString(row));
    }
}

