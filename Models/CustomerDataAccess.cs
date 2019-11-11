using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AspDotNetProject.Models
{
    public class CustomerDataAccess
    {
        string connectionString = string.Empty;
        SqlConnection connection;
        public CustomerDataAccess()
        {
            var conStr = ConfigurationManager.ConnectionStrings["NorthwindConnectionString"].ConnectionString;
            connectionString = conStr;
            connection = new SqlConnection(connectionString);
        }
        public List<Customer> GetCustomer()
        {
            List<Customer> customerlist = new List<Customer>();
            string sql = "SELECT CustomerID,CompanyName,ContactName,City,Country from Customers";
            SqlCommand command = new SqlCommand(sql, connection);
            SqlDataReader reader = null;
            try
            {
                connection.Open();
                reader = command.ExecuteReader(CommandBehavior.CloseConnection);
                while (reader.Read())
                {
                    Customer obj = new Customer
                    {
                        CustomerId = reader.GetString(0),
                        CompanyName = reader.GetString(1),
                        ContactName = reader.GetString(2),
                        City = reader.GetString(3),
                        Country = reader.GetString(4)
                    };
                    customerlist.Add(obj);
                }
            }
            catch
            {
                throw;
            }
            finally
            {
                if (reader != null)
                    if (!reader.IsClosed) reader.Close();
                if (connection.State != ConnectionState.Closed)
                    connection.Close();

            }
            return customerlist;
        }
        public void UpdateCustomer(Customer item)
        {
            if(item==null)
            {
                throw new ArgumentException(nameof(item), "value is null");
            }
            string sql="Update Customers Set CompanyName=@company,"+
                        "ContactName=@contact,City=@City,Country=@Country where CustomerId=@CustomerId";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@Company", item.CompanyName);
            command.Parameters.AddWithValue("@Contact", item.ContactName);
            command.Parameters.AddWithValue("@City", item.City);
            command.Parameters.AddWithValue("@Country", item.Country);
            command.Parameters.AddWithValue("@CustomerId", item.CustomerId);
            try
            {
                connection.Open();
                command.ExecuteNonQuery();

            }
            catch(SqlException)
            {
                throw;
            }

        }
    }
}