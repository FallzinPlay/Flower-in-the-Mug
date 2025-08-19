using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Attend_System
{
    internal class Drink
    {
        public string Name { get; private set; }
        public List<string> Recipe {  get; private set; }

        public Drink(string name, List<string> recipe)
        {
            this.Name = name;
            this.Recipe = recipe;
        }
    }
}
