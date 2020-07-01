using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Implementation.Static
{
    public static class RightListes
    {
        public static IEnumerable<int> AdminRights()
        {
            return new List<int> {1,2,3,4,5,6,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,24,26,27,28,29,30,31,32,33,34,35,36,37 };
        }
        public static IEnumerable<int> UserRights()
        {
            return new List<int> { 1, 2, 8, 9, 13, 14,18, 19, 23, 24, 29, 30, 34, 35,36 };
        }
        public static IEnumerable<int> NormalRights()
        {
            return new List<int> { 1,2,7,8,9,13,14,18,19,23,24,29,30,34,35 };
        }
    }
}
