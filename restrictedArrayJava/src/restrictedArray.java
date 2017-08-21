import java.util.ArrayList;
import java.util.Random;

public class RestrictedArray {
    private ArrayList internalArray = new ArrayList();
    private Random rand = new Random();
    private int size = rand.nextInt(20) + 1;
    private int specialValue = 9999;

    //constructor for now only doing with random size and numbers
    public RestrictedArray() {
        internalArray = new ArrayList();
        for (int i = 0; i < size; i++)
        {
            Integer r = rand.nextInt() % 256;
            this.internalArray.add(r);
        }
    }
        
    public java.lang.Object get(int key) {
        if (key >= 0 && key < size) {
            return this.internalArray.get(key);
        } else return null;
    }

    public void set(int key, int value) {
        if (key >= 0 && key < size) {
            this.internalArray.set(key, value);
        }
    }

    // measure length
    public int length() {
        int i = 0;
        int count = 0;
        while (this.get(i) != null) {
            count ++;
            i ++;
        }
        return count;
    }

    // print array
    public void print() {
        int i = 0;
        while (this.get(i) != null) {
            System.out.print(this.get(i) + " ");
            i ++;
        }
        System.out.print("\n");
    }

    //reverse array
    public void reverse() {
        int i = 0;
        int j = this.length() - 1;
        while (i <= j) {
            int numAtI = (int) this.get(i);
            int numAtJ = (int) this.get(j);
            this.set(i, numAtJ);
            this.set(j, numAtI);
            i ++;
            j --;
        }
    }

    //search
    public boolean search(int value) {
        int i = 0;
        int length = this.length();
        while (i < length) {
            if ((int) this.get(i) == value) {
                return true;
            }
            i++;
        }
        return false;
    }

    public void sort() {
        int i = 0;
        int length = (int) this.length();

        while (i < length) {
            int j = i + 1;
            int minIndex = i;
            while(j < length) {
                if ((int) this.get(minIndex) > (int) this.get(j)) {
                    minIndex = j;
                }
                j++;
            }
            int numAtI = (int) this.get(i);
            int numAtMinIndex = (int) this.get(minIndex);
            this.set(i, numAtMinIndex);
            this.set(minIndex, numAtI);
            i++;
        }
    }

    public void delete(int valueToDelete) {

        int i = 0;
        int length = this.length();

        while (i < length) {
            if ((int) this.get(i) == valueToDelete) {
                int j = i + 1;
                while (j < length) {
                    this.set(i, ((int) this.get(j)));
                    i++;
                    j++;
                }
                this.set((length - 1), specialValue);
            }
            i++;
        }
    }

    public java.lang.Object findLargest() {
        int largest;

        //if first val is 9999 array is empty.
        if ((int) this.get(0) != specialValue) {
            largest = (int) this.get(0);
        } else {
            return null;
        }
        int i = 0;

        int length = this.length();
        while (i < length) {
            if ((int) this.get(i) > largest && (int) this.get(i) != specialValue) {
                largest = (int) this.get(i);
            }
            i++;
        }

        return largest;
    }

    public void insertAscenting(int valueToInsert) {
        boolean room = false;
        int length = this.length();

        if ((int) this.get(length - 1) == specialValue) {
            room = true;
        }

        int i = 0;

        if (room) {
            if (length == 1) {
                this.set(0, valueToInsert);
                return;
            }

            while (i < length) {
              if ((int) this.get(i) > valueToInsert && (int) this.get(i) != specialValue) {
                  int temp = (int) this.get(i);
                  this.set(i, valueToInsert);
                  int j = i + 1;
                  while (j < length) {
                      int secondTemp = (int) this.get(j);
                      this.set(j, temp);
                      temp = secondTemp;
                      j++;
                      i++;
                  }
              } else if (((int) this.get(i) == specialValue) && ((int) this.get(i - 1) < valueToInsert)) {
                  this.set(i, valueToInsert);
              }
              i++;
            }
        }
    }
    public void empty() {
        int i = 0;
        int length = this.length();
        while (i < length) {
            this.set(i, specialValue);
            i++;
        }
    }
}
