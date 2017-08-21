using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace restricted_array
{
    class Program
    {
        static void Main(string[] args)
        {

            RestrictedArray arr1 = new RestrictedArray(5);
            arr1.printArray();
            arr1.reverse();
            arr1.printArray();
            arr1.sortAscending();
            arr1.printArray();
            arr1.search(arr1.getValueByIndex(2));
            arr1.search(888);
            arr1.delete(arr1.getValueByIndex(2));
            arr1.printArray();
            arr1.empty();
            arr1.printArray();
            Console.ReadKey();
        }
    }

    public class RestrictedArray
    {
        private int array_size;
        private int[] internalArray;
        private const int  SPECIALVALUE = 999;
        //constructor
        public RestrictedArray(int size=0)
        {
            Random random = new Random();

            if (size <= 0)
            {
                int randomNumber = random.Next(0, 20);
                array_size = 1 + randomNumber;
            }
            else
            {
                array_size = size;
            }

            internalArray = new int[array_size];
            for (int i = 0; i < array_size; i++)
            {
                internalArray[i] = random.Next(1, 200);
            }
        }

        public int length()
        {
            return array_size;
        }

        public void printArray()
        {
            for (int i = 0; i < array_size; i++)
            {
                Console.Write(internalArray[i] + "{0}", (i < (array_size - 1) ? " , " : "\n"));
            }
           
        }

        public void reverse()
        {
            for(int i = 0; i < array_size / 2; i++)
            {
                int tmp = internalArray[i];
                internalArray[i] = internalArray[array_size - i - 1];
                internalArray[array_size - i - 1] = tmp;
            }
        }

        public void search(int target)
        {
            for(int i = 0; i < array_size; i++ )
            {
                if(internalArray[i] == target)
                {
                    Console.WriteLine("{0} found in the array!", target);
                    return;
                }
            }
            Console.WriteLine("{0} not found in the array!", target);
        }

        public int getValueByIndex(int index)
        {
            if (index >= 0 && index < array_size)
            {
                return internalArray[index];
            }
            else
            {
                return -99999;
            }
        }

        public void setValueByIndex(int index, int value)
        {
            if (index >= 0 && index < array_size)
            {
                internalArray[index] =  value;
            }
        }

        public void sortAscending()
        {
            for (int i = 0; i < (array_size -1); i++)
            {
                for (int j = (i + 1); j < array_size; j++)
                {
                    if (internalArray[j] < internalArray[i])
                    {
                        int temp = internalArray[i];
                        internalArray[i] = internalArray[j];
                        internalArray[j] = temp;
                    }
                }
                    
            }
        }

        public void delete(int deleteTarget)
        {
            Console.WriteLine("Deleting value {0} in the array!", deleteTarget);
            for (int i = 0; i < array_size; i++)
            {
                if (internalArray[i] == deleteTarget)
                {
                    for (int j = (i + 1) ; j < array_size; j++)
                    {
                        internalArray[j - 1] = internalArray[j];
                    }
                    internalArray[array_size -1] = SPECIALVALUE;
                }
            }

        }

        public void empty()
        {
            for (int i = 0; i < array_size; i++)
            {
                internalArray[i] = SPECIALVALUE;
            }
        }

    }

}
