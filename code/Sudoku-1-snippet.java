int n = 3;
int nn = n * n;
int[][] predef = new int[nn][nn];

try (Scanner sc = new Scanner(new File(args[0]))) {
    for (int i = 0 ; i < nn ; i++)
        for (int j = 0 ; j < nn ; j++)
            predef[i][j] = sc.nextInt();
}
