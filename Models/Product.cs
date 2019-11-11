using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspDotNetProject.Models
{
    public class Product
    {
        public int productId { get; set; }
        public string ProductName { get; set;}
        public decimal UnitPrice { get; set; }
        public short UnitsInStock { get; set; }
        public bool Discontinued { get; set; }
        public int CategoryId { get; set; }
    }
}
