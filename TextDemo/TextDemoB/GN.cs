using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace TextDemoB
{
    class GN
    {
        string a = "Data Source=.;Integrated Security=True";
        SqlConnection b;

        public void K()
        {
            b = new SqlConnection(a);
            b.Open();
        }
        public void G()
        {
            b.Close();
        }

        public void JK()//建库
        {
            K();
            StringBuilder ww = new StringBuilder();
            ww.AppendLine("if not exists(select * from sys.databases where name='MT')");
            ww.AppendLine("create database MT");
            SqlCommand c = new SqlCommand(ww.ToString(), b);
            int aa = c.ExecuteNonQuery();
            G();

            K();
            StringBuilder ss = new StringBuilder();
            ss.AppendLine("use MT");
            ss.AppendLine("if not exists(select * from sys.Objects where name='TblBookType')");
            ss.AppendLine("create table TblBookType(ID int identity(1,1) primary key not null, TypeName Varchar(50) not null)");
            SqlCommand s = new SqlCommand(ss.ToString(), b);
            int uu = s.ExecuteNonQuery();
            G();

            K();
            StringBuilder tt = new StringBuilder();
            tt.AppendLine("use MT");
            tt.AppendLine("if not exists(select * from sys.Objects where name='TblBookInfo')");
            tt.AppendLine("create table TblBookInfo( BookID int primary key not null, BookName Varchar(50) not null, BookAuthor Varchar(50) not null, BookTypeID int not null, BookConcert Varchar(50),BookState Varchar(20) CHECK (BookState in ('是','否')))");
            SqlCommand d = new SqlCommand(tt.ToString(), b);
            int bb = d.ExecuteNonQuery();
            G();

            K();
            StringBuilder wwa = new StringBuilder();//主外键关系
            wwa.AppendLine("use MT");
            //wwa.AppendLine("alter table TblBookInfo");
            //wwa.AppendLine("add constraint FK_ABC");
            //wwa.AppendLine("foreign key (BookTypeID) references TblBookType(ID)");
            wwa.AppendLine("ALTER TABLE TblBookInfo");
            wwa.AppendLine("ADD FOREIGN KEY (BookTypeID)");
            wwa.AppendLine("REFERENCES TblBookType(ID)");
            SqlCommand ca = new SqlCommand(wwa.ToString(), b);
            int aaa = ca.ExecuteNonQuery();
            G();

            K();
            SqlCommand q = new SqlCommand("Use MT;select COUNT(*) from TblBookType", b);
            if ((int)q.ExecuteScalar() == 0)
            {
                SqlCommand f = new SqlCommand("Use MT;INSERT INTO TblBookType VALUES ('小说');INSERT INTO TblBookType VALUES ('军事');INSERT INTO TblBookType VALUES ('科幻')", b);
                int cc = f.ExecuteNonQuery();
            }
            G();

            K();
            SqlCommand e = new SqlCommand("Use MT;select COUNT(*) from TblBookInfo", b);
            if ((int)e.ExecuteScalar() == 0)
            {
                SqlCommand f = new SqlCommand("Use MT;INSERT INTO TblBookInfo VALUES (1,'背影','朱自清',1,'印书馆','是');INSERT INTO TblBookInfo VALUES (2,'战争','张三',2,'电子','是');INSERT INTO TblBookInfo VALUES (3,'经济','李四',3,'青少年','否')", b);
                int cc = f.ExecuteNonQuery();
            }
            G();
        }

        public int ZS()//总数
        {
            K();
            SqlCommand e = new SqlCommand("Use MT;select COUNT(*) from TblBookInfo", b);
            return (int)e.ExecuteScalar();
        }

        public SqlDataAdapter XS()//显示全部
        {
            K();
            StringBuilder wa = new StringBuilder();
            wa.AppendLine("use MT");
            wa.AppendLine("if not exists(select * from sys.Objects where name='c')");
            wa.AppendLine("select a.BookID,a.BookName,a.BookAuthor,a.BookConcert,a.BookState,b.TypeName into c");
            wa.AppendLine("from TblBookInfo a left join TblBookType b on a.BookTypeID = b.ID");
            wa.AppendLine("select * from c");
            SqlDataAdapter sda = new SqlDataAdapter(wa.ToString(), b);
            G();
            return sda;
        }

        public bool ZJBC()//直接保存
        {
            K();
            SqlDataAdapter sda = new SqlDataAdapter("Use MT;SELECT * FROM c", b);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            SqlCommandBuilder aaa = new SqlCommandBuilder(sda);
            sda.Update(ds);
            G();
            return true;
        }

        public void SK()//删库
        {
            K();
            SqlCommand g = new SqlCommand("Use MT;drop table TblBookInfo;drop table TblBookType;drop table c", b);
            int dd = g.ExecuteNonQuery();
            G();
        }

        public bool Del(string a)//条件删除
        {
            K();
            SqlCommand h = new SqlCommand("Use MT;delete from TblBookInfo Where BookName ='" + a + "'", b);
            if ((int)h.ExecuteNonQuery() >= 1)
            {
                G();
                return true;
            }
            else
            {
                G();
                return false;
            }
        }

        public SqlDataAdapter Question(string a,string c,string d)//查询
        {
            string bb = "";
            K();
            if (d == "A")
                bb = "Use MT;SELECT * FROM TblBookInfo Where " + a + " = '" + c + "'";
            else if (d == "C")
                bb = "Use MT;SELECT * FROM TblBookInfo Where " + a + " = " + c + "";
            else
                bb = "Use MT;SELECT * FROM TblBookInfo Where " + a + " Like '%" + c + "%'";
            SqlDataAdapter i = new SqlDataAdapter(bb, b);
            G();
            return i;
        }

        public int ZH(string a)//转换
        {
            K();
            SqlCommand zh = new SqlCommand("Use MT;select ID from TblBookType where TypeName='" + a + "'", b);
            try
            {
                int i = (int)zh.ExecuteScalar();
                return i;
            }
            catch (Exception)
            {
                return 0;
            }
            
        }

        public bool XG(string a, string c, string d, string e,string f)//修改
        {
            K();
            if (ZH(f) == 0)
                return false;
            SqlCommand j = new SqlCommand("Use MT;UPDATE TblBookInfo SET BookConcert = '" + c + "',BookName = '" + d + "',BookAuthor = '" + e + "',BookTypeID = "+ZH(f)+" WHERE BookID = " + a + "", b);
            if ((int)j.ExecuteNonQuery() == 1)
            {
                G();
                return true;
            }
            else
            {
                G();
                return false;
            }
        }
    }
}
