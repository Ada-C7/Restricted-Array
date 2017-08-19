public class CSFunPractice {

    public static void main(String[] args) {


        // create a new restricted array
        RestrictedArray myRestrictedArray = new RestrictedArray();
        System.out.print(myRestrictedArray.get(0) + "\n");
        System.out.print(myRestrictedArray.length()  + "\n");
        myRestrictedArray.print();

        myRestrictedArray.reverse();
        myRestrictedArray.print();
    }
}
