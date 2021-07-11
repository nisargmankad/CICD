using System.IO;
using System;

namespace HelloWorldTest
{
    
    public class UnitTest1
    {
        private const string Expected ="Hello Tom!";
        public void TestMethod1()
        {
            using (var sw = new StringWriter())
            {
                Console.SetOut(sw);
                CICD_Demo.Program.Main();

                var result= sw.ToString().Trim();
                AssemblyLoadEventArgs.Equals(Expected,result);
            }
        }
    }
}
