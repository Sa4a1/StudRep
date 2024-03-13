using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace unittest
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

        }
       
        private void button1_Click(object sender, EventArgs e)
        {
            string password;
            password = textBox1.Text;
            int countNumeric = 0;
            int countLiteral = 0;
            bool upperLiteral = false;
            bool lowerLiteral = false;
            bool symbol = false;
           if(password.Length == 8 )
            {
                for (int i = 0; i < password.Length; i++)
                {
                    if (char.IsDigit(password[i])) countNumeric++;
                    else countLiteral++;
                    if (char.IsLower(password[i]) && char.IsLetter(password[i])) lowerLiteral = true;
                    if (char.IsUpper(password[i]) && char.IsLetter(password[i])) upperLiteral = true;
                    if (!char.IsLetter(password[i])) symbol = true;
                }
            }
        }
    }
}
