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
    public partial class AdminFrm : Form
    {
        public AdminFrm()
        {
            InitializeComponent();
        }

        private void 查询学生人数ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SchoolManager aa = new SchoolManager();
            MessageBox.Show(aa.StudentNumber());
        }      
    }
}
