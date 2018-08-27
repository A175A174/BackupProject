using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace ExamSystem
{
    class SchoolManager
    {
       
        DBHelper myDBHelper = new DBHelper();//创建DBHelper对象实例
        public string StudentNumber()//查询学生数量并处理结果
        {
            int iStuNum = myDBHelper.GetStudentNumber();
            if (iStuNum == -1)  
            {
                return ("查询失败");
            }
            else
            {
                return ("在学校的人数：" + iStuNum);
            }
        }
    }
}
