public class ParseOutput {
    public static void main(String[] args) {
        String s = String.join("", args);
        if(s.indexOf("FAILURE") < 0) {
            System.out.println("Passed all test cases");
            System.exit(100);
        }
        else{
            if (s.indexOf("testMerge") > -1) {
                System.out.println("Failed testMerge");
            }
            if (s.indexOf("testFilter") > -1) {
                System.out.println("Failed testFilter");
            }
        }
        System.exit((2 - Integer.parseInt(args[args.length - 1])) * 50);
    }
}
