using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace ExamSystem
{
    class DBHelper
    {
        string connString = "Data Source=USERUQI-I1DSM1D\\SQLEXPRESS;Initial Catalog=ExamSystemDB;Integrated Security=True";//连接字符串
        //红色字体的代码是在连接数据库时我们所使用的服务器自动生成的代码， 连接字符串代码无需手打，复制粘贴即可

        SqlConnection conn;//Command对象使用的数据库连接P85

        public void TestOpenDB()//定义打开数据库方法
        {
            conn = new SqlConnection(connString);
            conn.Open();
        }

        public void TestCloseDB()//定义关闭数据库方法
        {
            conn.Close();
        }

        public int GetStudentNumber()//查询人数
        {
            string strSql = "select count(*)from dbo.Student";
            try
            {
                TestOpenDB();//调用打开数据库方法
                SqlCommand comm = new SqlCommand(strSql, conn);
                return (int)comm.ExecuteScalar();
            }
            catch (Exception)
            {
                return -1;//返回结果为-1：表示失败；其它结果表示成功
            }
            finally
            {
                TestCloseDB();//调用关闭数据库方法
            }
        }      
    }
}
    
   