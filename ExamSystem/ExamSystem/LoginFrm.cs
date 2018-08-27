using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace ExamSystem
{
    public partial class LoginFrm : Form
    {
        public LoginFrm()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=USERUQI-I1DSM1D\\SQLEXPRESS;Initial Catalog=ExamSystemDB;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connectionString);

            string sqlStr = string.Format("select count(*)from Login where id='{0}' and Pwd='{1}'", txtName.Text, txtPassword.Text);
            try
            {
                conn.Open();
                SqlCommand comm = new SqlCommand(sqlStr, conn);//
                if ((int)comm.ExecuteScalar() == 1)//返回执行结果
                {
                    AdminFrm mainFrm = new AdminFrm();
                    mainFrm.Show();
                    this.Hide();
                }
                else
                {
                    MessageBox.Show("请核对用户名及密码!");
                }
            }
            catch (Exception)
            {
                MessageBox.Show("数据库暂时无法访问!");
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
