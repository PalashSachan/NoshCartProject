using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace NoshCart.DataLayer
{
    public class DataAccess
    {
        public static string ConnectionString //invoked when to get the connection string of sql database
        {
            get //get method
            {
                return ConfigurationManager.ConnectionStrings["shoppingDB"].ConnectionString.ToString(); //returning the connection string
            }
        }

        public static SqlParameter AddParameter(string parameterName, object value, SqlDbType DbType, int size) //invoked when to add a sqlparameter
        {
            SqlParameter param = new SqlParameter(); //creating the sqlparameter object
            param.ParameterName = parameterName; //setting the parameter name
            param.Value = value.ToString(); //setting the value of the parameter
            param.SqlDbType = DbType; //setting the data type
            param.Size = size; //setting the size
            param.Direction = ParameterDirection.Input; //setting the direction
            return param; //returning the sql parameter
        }

        public static DataTable ExecuteDTByProcedure(string ProcedureName,SqlParameter[] Params) //invoked when to execute a stored procedure
        {
            SqlConnection conn = new SqlConnection(ConnectionString); //creating the sql connection
            SqlCommand cmd = new SqlCommand(); //creating the sql command
            cmd.Connection = conn; //connecting the sql command to sql connection
            cmd.CommandText = ProcedureName; //adding the stored procedure name
            cmd.Parameters.AddRange(Params); //adding the parameters
            cmd.CommandType = CommandType.StoredProcedure; //setting the type as stored procedure
            SqlDataAdapter adopter = new SqlDataAdapter(cmd); //sql command execution
            DataTable dTable = new DataTable(); //creating the new datatable

            try //starting try block
            {
                adopter.Fill(dTable); //adapter is filling the rows and colums of datatable
            }

            catch (Exception ex) //catch block
            {
                string str = ex.Message; //storing the error message
            }

            finally //finally block start
            {
                //clearing or disposing or closing all the connections
                adopter.Dispose();
                cmd.Parameters.Clear();
                cmd.Dispose();
                conn.Dispose();
            }
            return dTable; //returning the datatable
        }
    }
}