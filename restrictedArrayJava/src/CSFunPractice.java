public class CSFunPractice {

    public static void main(String[] args) {


        // create a new restricted array
        RestrictedArray myRestrictedArray = new RestrictedArray();
        System.out.print(myRestrictedArray.get(0) + "\n");
        System.out.print(myRestrictedArray.length()  + "\n");
        myRestrictedArray.print();

        myRestrictedArray.reverse();
        myRestrictedArray.print();

        int valueToFind = 120;
        if (myRestrictedArray.search(valueToFind)) {
            System.out.print(valueToFind + " found in array! \n");
        } else {
            System.out.print(valueToFind + " not found in array! \n");
        }

        int otherValueToFind = (int) myRestrictedArray.get(0);

        if (myRestrictedArray.search(otherValueToFind)) {
            System.out.print(otherValueToFind + " found in array! \n");
        } else {
            System.out.print(otherValueToFind + " not found in array! BUGGGGGG.\n");
        }

        myRestrictedArray.sort();
        System.out.print("Sorted \n");
        myRestrictedArray.print();
    }
}
