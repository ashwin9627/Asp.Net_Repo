using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace AspDotNetProject.Models
{
    class ProductDAO
    {
        //All stored procedures names
        const string GETALL = "sp_GetAllProducts";
        const string GETProduct = "sp_GetAllProcuts2";
        const string GETDETAILS = "sp_GetProduct1";
        const string INSERT = "sp_createprocedure";
        const string UPDATE = "sp_updateproduct";
        const string Search = "sp_GetAllProducts1";


        SqlConnection connection;
        string connectionString= @"server=KALIDASA\SQLDEV2016;database=northwind;integrated security=sspi";

        private void CreateConnection()
        {
            if (connection == null)
                connection = new SqlConnection(connectionString);
        }

        private void CloseConnection()
        {
            if (connection != null)
              
            if (connection.State != ConnectionState.Closed)
                connection.Close();
        }
        private void OpenConnection()
        {
            if (connection != null)

                if (connection.State != ConnectionState.Open)
                    connection.Open();
        }

        private Product CreateProductFromReader(SqlDataReader reader)
        {
            Product p = new Product();
            p.productId = Convert.ToInt32("0" + reader["ProductId"].ToString());
            p.ProductName = reader["ProductName"].ToString();
            p.UnitPrice= Convert.ToDecimal("0" + reader["UnitPrice"].ToString());
            p.UnitsInStock= Convert.ToInt16("0" + reader["UnitsInStock"].ToString());
            p.Discontinued = Convert.ToBoolean(reader["Discontinued"].ToString());
            p.CategoryId= Convert.ToInt32("0" + reader["CategoryId"].ToString());
            return p;
        }

        #region DataAccess public Methods
        public List<Product> GetProducts(string criteria)
        {
            //check whether the argument is passe or not.
            //if(string.IsNullOrEmpty(criteria))
            //{
            //    throw new ArgumentNullException(nameof(criteria), "required argument missing");

            //}
            List<Product> productList = new List<Product>();
            //create the command and setup the parameters
            CreateConnection();
            SqlCommand command = connection.CreateCommand();
            command.Connection = connection;
            command.CommandText = GETALL;
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@search", criteria);
            //Open the connection and execute the statement within the try catch block.
            SqlDataReader reader = null;
            try
            {
                OpenConnection();
                reader = command.ExecuteReader();
                while (reader.Read())
                {
                    var product = CreateProductFromReader(reader);
                   productList.Add(product);
                }
            }
            catch(SqlException)
            {
                throw;

            }
            catch(Exception)
            {
                throw;
            }
            finally
            {
                if (reader != null) if (!reader.IsClosed) reader.Close();
                CloseConnection();
            }
            return productList;
        }
        
        public List<Product> GetProduct(int productId)
        {
            
            List<Product> productList = new List<Product>();
            //create the command and setup the parameters
            CreateConnection();
            SqlCommand command = connection.CreateCommand();
            command.Connection = connection;
            command.CommandText = GETProduct;
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@productid1", productId);
            //Open the connection and execute the statement within the try catch block.
            SqlDataReader reader = null;
            try
            {
                OpenConnection();
                reader = command.ExecuteReader();
                while (reader.Read())
                {
                    var product = CreateProductFromReader(reader);
                       productList.Add(product);
                }
            }
            catch (SqlException)
            {
                throw;

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (reader != null) if (!reader.IsClosed) reader.Close();
                CloseConnection();
            }
            return productList;
        }


        public List<Product> GetProductSearch(string product)
        {

            List<Product> productList = new List<Product>();
            //create the command and setup the parameters
            CreateConnection();
            SqlCommand command = connection.CreateCommand();
            command.Connection = connection;
            command.CommandText = Search;
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@search", product);
            //Open the connection and execute the statement within the try catch block.
            SqlDataReader reader = null;
            try
            {
                OpenConnection();
                reader = command.ExecuteReader();
                while (reader.Read())
                {
                    var product1 = CreateProductFromReader(reader);
                    productList.Add(product1);
                }
            }
            catch (SqlException)
            {
                throw;

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (reader != null) if (!reader.IsClosed) reader.Close();
                CloseConnection();
            }
            return productList;
        }


        public void CreateProduct(Product item)
        {
            if (item == null)
                throw new ArgumentNullException(nameof(item), "Required argument missing");
            CreateConnection();
            //build a command and assign all the parameters
            SqlCommand command = new SqlCommand(INSERT, connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = INSERT;

            SqlParameter p1 = new SqlParameter();
            p1.ParameterName = "@ProductName";
            p1.SqlDbType = SqlDbType.VarChar;
            p1.Size = 50;
            p1.Direction = ParameterDirection.Input;
            p1.Value = item.ProductName;
            command.Parameters.Add(p1);

            command.Parameters.Add(new SqlParameter("@unitPrice", item.UnitPrice));
            command.Parameters.Add(new SqlParameter("@unitsInStock", item.UnitsInStock));
            command.Parameters.Add(new SqlParameter("@discontinued", item.Discontinued));
            command.Parameters.Add(new SqlParameter("@categoryid", item.CategoryId));

            OpenConnection();
            SqlTransaction trans = connection.BeginTransaction();
            command.CommandText = INSERT;
            command.Transaction = trans;
        //    command.CommandText = trans;
            try
            {
                command.ExecuteNonQuery();
                trans.Commit();
            }
            catch(SqlException)
            {
                
                trans.Rollback();
                throw;
            }
            catch(Exception)
            {
                trans.Rollback();
            }
            finally
            {
                CloseConnection();
            }
        }
        public void UpdateProduct(Product item) {
            if (item == null)
                throw new ArgumentNullException(nameof(item), "Required argument missing.");

            CreateConnection();
            //BUild a command and assign all the parameters 
            SqlCommand command = new SqlCommand(UPDATE, connection);
            command.CommandType = CommandType.StoredProcedure;

            SqlParameter p1 = new SqlParameter();
            p1.ParameterName = "@productName";
            p1.SqlDbType = SqlDbType.VarChar;
            p1.Size = 50;
            p1.Direction = ParameterDirection.Input;
            p1.Value = item.ProductName;
            command.Parameters.Add(p1);

            command.Parameters.Add(new SqlParameter("@unitPrice", item.UnitPrice));
            command.Parameters.Add(new SqlParameter("@unitsInStock", item.UnitsInStock));
            command.Parameters.AddWithValue("@discontinued", item.Discontinued);
            command.Parameters.AddWithValue("@categoryId", item.CategoryId);
            command.Parameters.AddWithValue("@productId", item.productId);


            OpenConnection();
            SqlTransaction trans = connection.BeginTransaction();
            command.Transaction = trans;
            try
            {
                command.ExecuteNonQuery();
                trans.Commit();
            }
            catch (SqlException)
            {
                trans.Rollback();
                throw;
            }
            catch (Exception)
            {
                trans.Rollback();
                throw;
            }
            finally
            {
                CloseConnection();
            }
        }

    }
    #endregion

}
