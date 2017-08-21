public class CSFunPractice {

    public static void main(String[] args) {


        // create a new restricted array
        RestrictedArray myRestrictedArray = new RestrictedArray();
        System.out.print(myRestrictedArray.get(0) + " is first element \n");
        System.out.print(myRestrictedArray.length()  + " is length \n");
        myRestrictedArray.print();

        myRestrictedArray.reverse();
        System.out.print("Reversed is: ");
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
        System.out.print("Sorted ascending: ");
        myRestrictedArray.print();

        int length = myRestrictedArray.length();
        int valueToDelete = (int) myRestrictedArray.get(length/2);

        myRestrictedArray.delete(valueToDelete);
        System.out.print(valueToDelete + " deleted from array \n");
        myRestrictedArray.print();

        RestrictedArray newRestrictedArray = new RestrictedArray();
        int largest = (int) newRestrictedArray.findLargest();
        System.out.print("new Array: ");
        newRestrictedArray.print();
        System.out.print("The largest value in this new array is " + largest + "\n");

        int valueToInsert = 123;
        System.out.print("Old Array: ");
        myRestrictedArray.print();
        myRestrictedArray.insertAscenting(valueToInsert);
        System.out.print(valueToInsert + " inserted into the old array: \n");
        myRestrictedArray.print();

        myRestrictedArray.empty();
        myRestrictedArray.print();
    }

}
