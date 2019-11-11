using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspDotNetProject.Models
{
    class productProcess
    {
        ProductDAO dao;
        public productProcess()
        {
            dao = new ProductDAO();
        }
        public List<Product>GetProducts(string criteria)
        {
            return dao.GetProducts(criteria);
        }
        public List<Product> GetProduct(int productid)
        {
            return dao.GetProduct(productid);
        }

        public void CreateProduct(Product item)
        {
          dao.CreateProduct(item);
        }
        public void UpdateProduct1(Product item)
        {
            dao.UpdateProduct(item);
        }

        public List<Product> GetProductSearchProcess(string item)
        {
            return dao.GetProductSearch(item);
        }

        
    }
}