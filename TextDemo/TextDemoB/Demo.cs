using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Drawing.Printing;
using System.IO;
using CCWin;

namespace TextDemoB
{
    public partial class TextDemoB : CCSkinMain
    {
        public TextDemoB()
        {
            InitializeComponent();
            printDocument.OriginAtMargins = true;//启用页边距
            pageSetupDialog.EnableMetric = true; //以毫米为单位
        }
        GN aa = new GN();

        private void TextDemoB_Load(object sender, EventArgs e)
        {
            aa.JK();
            label9.Text = "共有条数为："+aa.ZS()+"条";
            aa.G();
            label10.Text = DateTime.Now.ToLocalTime().ToString();
            DataSet ds = new DataSet();
            aa.XS().Fill(ds);
            dataGridView1.DataSource = ds.Tables[0].DefaultView;
        }

        private void printDocument_PrintPage(object sender, PrintPageEventArgs e)
        {
            Bitmap _NewBitmap = new Bitmap(dataGridView1.Width, dataGridView1.Height);
            dataGridView1.DrawToBitmap(_NewBitmap, new Rectangle(0, 0, _NewBitmap.Width, _NewBitmap.Height));
            e.Graphics.DrawImage(_NewBitmap, 0, 0, _NewBitmap.Width, _NewBitmap.Height); 
        }

        private void TextDemoB_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (DialogResult.OK == MessageBox.Show("你确定要关闭应用程序吗？", "关闭提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Question))
            {
                aa.SK();
                this.FormClosing -= new FormClosingEventHandler(this.TextDemoB_FormClosing);
            }
            else
            {
                e.Cancel = true;
            }

            //DialogResult a = MessageBox.Show("是否退出？", "提示！", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            //if (a == DialogResult.Yes)
            //{
            //    //this.Close();
            //    Application.Exit();
            //    aa.SK();
            //}
        }

        private void skinButton1_Click(object sender, EventArgs e)
        {
            if (aa.ZJBC())
                MessageBox.Show("OK!");
        }

        private void skinButton2_Click(object sender, EventArgs e)
        {
            if (aa.XG(t5.Text.Trim(), t1.Text.Trim(), t2.Text.Trim(), t3.Text.Trim(), t4.Text.Trim()))
            {
                MessageBox.Show("OK!");
                DataSet ds = new DataSet();
                aa.XS().Fill(ds);
                dataGridView1.DataSource = ds.Tables[0].DefaultView;
            }
            else
                MessageBox.Show("填写不完整或类型错误！");
        }

        private void skinButton3_Click(object sender, EventArgs e)
        {
            if (aa.Del(textBox5.Text.Trim()))
                MessageBox.Show("OK!");
            else
                MessageBox.Show("无此书!");
            DataSet ds = new DataSet();
            aa.XS().Fill(ds);
            dataGridView1.DataSource = ds.Tables[0].DefaultView;
        }

        private void skinButton4_Click(object sender, EventArgs e)
        {
            string a = "";
            string d;
            if (A.Checked == true)
                d = "A";
            else
                d = "B";
            string xx = textBox1.Text.Trim();
            switch (skinComboBox1.Text.Trim())
            {
                case "编号":
                    a = "BookID";
                    break;
                case "书名":
                    a = "BookName";
                    break;
                case "作者":
                    a = "BookAuthor";
                    break;
                case "类型":
                    d = "C";
                    a = "BookTypeID";
                    xx = aa.ZH(textBox1.Text.Trim()).ToString();
                    aa.G();
                    break;
                default:
                    break;
            }
            DataSet ds = new DataSet();
            try
            {
                aa.Question(a, xx, d).Fill(ds);
                dataGridView1.DataSource = ds.Tables[0].DefaultView;
            }
            catch (Exception)
            {
                MessageBox.Show("查询信息不完整！");
            }
        }

        private void skinButton5_Click(object sender, EventArgs e)
        {
            printPreviewDialog.Document = printDocument;
            printPreviewDialog.ShowDialog();
        }

        private void skinButton6_Click(object sender, EventArgs e)
        {
            pageSetupDialog.ShowDialog();
        }

        private void skinButton7_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            aa.XS().Fill(ds);
            dataGridView1.DataSource = ds.Tables[0].DefaultView;
        }

        private void skinButton8_Click(object sender, EventArgs e)
        {
            if (this.printDialog.ShowDialog() == DialogResult.OK)
            {
                this.printDocument.Print();
            }
        }
    }
}
