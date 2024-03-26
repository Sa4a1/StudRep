using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Test2
{
    public partial class Form1 : Form
    {
        public bool SideLessThanZero(double side)
        {
            if (side <= 0) return true;
            else return false;
        }

        public bool CheckUpperLimit(double sideLenth)
        {
            if (sideLenth > 50) return true;
            else return false;
        }

        public bool RealTriangel(double sideA, double sideB,double sideC)
        {
            if (sideA + sideB <= sideC || sideC + sideB <= sideA || sideA + sideC <= sideB) return false;
            else return true;
        }

        public bool IsoscelesTriangle(double sideA, double sideB, double sideC)
        {
            if (sideA == sideB || sideA == sideC || sideC == sideB) return true;
            else return false;
        }

        public bool EquilateralTriangle(double firstSide, double secondSide, double thirdSide)
        {
            if(firstSide == secondSide && firstSide == thirdSide) return true;
            else return false;
        }

        public bool ScaleneTriangle (double firstSide, double secondSide, double thirdSide)
        {
            if(firstSide!= secondSide && secondSide != thirdSide && firstSide!=thirdSide) return true;
            else return false;
        }

        public bool RightTriangel(double firstSide, double secondSide, double thirdSide)
        {
            if ((Math.Pow(firstSide, 2) == Math.Pow(secondSide, 2) + Math.Pow(thirdSide, 2))
                || (Math.Pow(secondSide, 2) == Math.Pow(firstSide, 2) + Math.Pow(thirdSide, 2)) ||
                    (Math.Pow(thirdSide, 2) == Math.Pow(firstSide, 2) + Math.Pow(secondSide, 2))) return true;
            else return false;
        }

        public Form1()
        {
            InitializeComponent();
        }

        public static int CountA = 0;
        public static int CountB = 0;
        public static int CountC = 0;
        public static int PosA = 0;
        public static int PosB = 0;
        public static int PosC = 0;

        private void button1_Click(object sender, EventArgs e)
        {
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
        }

        private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (CountA == 0 && e.KeyChar == '-' && PosA == 0)
            {
                CountA++;
                PosA++;
            }
            else if (PosA >= 0 && CountA >= 0)
            {
                e.Handled = !(Char.IsDigit(e.KeyChar));
                PosA++;
                CountA++;

            }

        }

        private void textBox2_KeyPress(object sender, KeyPressEventArgs e)
        {
            //e.Handled = !(Char.IsDigit(e.KeyChar));
            if (PosB == 0 && CountB == 0 && e.KeyChar == '-')
            {
                CountB++;
                PosB++;
            }
            else if (PosB >= 0 && CountB >= 0)
            {
                e.Handled = !(Char.IsDigit(e.KeyChar));
                PosB++;
                CountB++;
            }
        }

        private void textBox3_KeyPress(object sender, KeyPressEventArgs e)
        {
            //e.Handled = !(Char.IsDigit(e.KeyChar));
            if (CountC == 0 && e.KeyChar == '-' && PosC == 0)
            {
                CountC++;
                PosC++;
            }
            else if (PosC >= 0 && CountC >= 0)
            {
                e.Handled = !(Char.IsDigit(e.KeyChar));
                PosC++;
                CountC++;
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {

            if (textBox1.Text != "")
            {
                string substr = System.Globalization.CultureInfo.CurrentCulture.NumberFormat.NumberDecimalSeparator[0].ToString();
                int count = (textBox1.Text.Length - textBox1.Text.Replace(substr, "").Length) / substr.Length;
                if (count == 0) textBox1.Text = textBox1.Text + ",";
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (textBox2.Text != "")
            {
                string substr = System.Globalization.CultureInfo.CurrentCulture.NumberFormat.NumberDecimalSeparator[0].ToString();
                int count = (textBox2.Text.Length - textBox2.Text.Replace(substr, "").Length) / substr.Length;
                if (count == 0) textBox2.Text = textBox2.Text + ",";
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            if (textBox3.Text != "")
            {
                string substr = System.Globalization.CultureInfo.CurrentCulture.NumberFormat.NumberDecimalSeparator[0].ToString();
                int count = (textBox3.Text.Length - textBox3.Text.Replace(substr, "").Length) / substr.Length;
                if (count == 0) textBox3.Text = textBox3.Text + ",";
            }
        }

        private void Result_Click(object sender, EventArgs e)
        {
            StringBuilder error = new StringBuilder();
            if (string.IsNullOrWhiteSpace(textBox1.Text) || textBox1.Text == "-") error.AppendLine("Введите сторону А");
            if (string.IsNullOrWhiteSpace(textBox2.Text) || textBox2.Text == "-") error.AppendLine("Введите сторону B");
            if (string.IsNullOrWhiteSpace(textBox3.Text) || textBox3.Text == "-") error.AppendLine("Введите сторону C");

            if (error.Length > 0)
            {
                MessageBox.Show(error.ToString());
                return;
            }
            else
            {
                double a=Convert.ToDouble(textBox1.Text);
                double b=Convert.ToDouble(textBox2.Text);
                double c=Convert.ToDouble(textBox3.Text);
                if (SideLessThanZero(a) || SideLessThanZero(b) || SideLessThanZero(c)) label1.Text = "Была введена сторона, равная или меньше нуля";
                else if (CheckUpperLimit(a) || CheckUpperLimit(b) || CheckUpperLimit(c)) label1.Text = "Превышен диапазон допустимых значений";
                else if (!RealTriangel(a,b,c)) label1.Text = "Треугольника не существует";
                else if (EquilateralTriangle(a,b,c)) label1.Text = "Треугольник равносторонний";
                else if (IsoscelesTriangle(a,b,c)) label1.Text = "Треугольник равнобедренный";
                else if (ScaleneTriangle(a,b,c)) label1.Text = "Треугольник разносторонний";

                if (RightTriangel(a,b,c))
                {
                    label1.Text += "\nТреугольник прямоугольный";
                }
            }
        }
    }
}
