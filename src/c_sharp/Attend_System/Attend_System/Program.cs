using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Attend_System
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // Criando as bebidas
            Drink drink1 = new Drink("drink1", new List<string>() {"a", "b"});
            Drink drink2 = new Drink("drink2", new List<string>() {"b", "c"});
            Drink drink3 = new Drink("drink3", new List<string>() {"c", "a"});

            // Criando a lista de bebidas e adicionando as existentes
            List<Drink> drink_list = new List<Drink>()
            { drink1, drink2, drink3 };

            // Criando o viajante
            Traveller traveller = new Traveller("Bob");
            Drink asked = traveller.AskDrink(drink_list);
            Console.WriteLine(asked.Name);
            for (int i = 0; i < asked.Recipe.Count; i++)
            {
                Console.WriteLine(asked.Recipe[i]);
            }
        }
    }
}
