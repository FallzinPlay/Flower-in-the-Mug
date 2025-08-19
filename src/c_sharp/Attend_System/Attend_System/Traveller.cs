using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Attend_System
{
    internal class Traveller
    {
        public string Name {  get; private set; }
        private Random random = new Random();

        public Traveller(string name) { 
            this.Name = name;
        }

        public Drink AskDrink(List<Drink> drink_list) {
            return drink_list[random.Next(drink_list.Count - 1)];
        }
    }
}
