#include <iostream>
#include <cmath>

using namespace std;

struct Point {
    double x, y;
};

double distance(Point p1, Point p2) {
    return sqrt(pow(p2.x - p1.x, 2) + pow(p2.y - p1.y, 2));
}

double crossProduct(Point a, Point b, Point c) {
    return (b.x - a.x) * (c.y - b.y) - (b.y - a.y) * (c.x - b.x);
}



double computeAngle(Point a, Point b, Point c) {
    double baX = a.x - b.x;
    double baY = a.y - b.y;

    double bcX = c.x - b.x;
    double bcY = c.y - b.y;

    return acos((baX * bcX + baY * bcY) / (sqrt(pow(baX, 2) + pow(baY, 2)) * sqrt(pow(bcX, 2) + pow(bcY, 2))));
}

bool isParallelogram(Point a, Point b, Point c, Point d) {
    if (distance(a, b) == distance(c, d) && distance(b, c) == distance(a, d) && distance(a, b) != distance(b, c))
    {
        if (computeAngle(a, b, c) == computeAngle(c, d, a) && computeAngle(b, c, d) == computeAngle(d, a, b) && computeAngle(d, a, b) != computeAngle(a, b, c))
        {
            return true;
        }
        else return false;
    }
    else return false;
}

bool isRhombus(Point a, Point b, Point c, Point d) {
    if ((distance(a, b) == distance(c, d) && distance(b, c) == distance(a, d) && distance(a, b) == distance(b, c)) && (computeAngle(a, b, c) == computeAngle(c, d, a) && computeAngle(b, c, d) == computeAngle(d, a, b) && computeAngle(d, a, b) != computeAngle(a, b, c) && computeAngle(b, c, d) != computeAngle(c, d, a))) {
        return true;
    }
    else return false;
}

bool isSquare(Point a, Point b, Point c, Point d) {
    if ((distance(a, b) == distance(c, d) && distance(b, c) == distance(a, d) && distance(a, b) == distance(b, c)) && (computeAngle(a, b, c) == computeAngle(c, d, a) && computeAngle(b, c, d) == computeAngle(d, a, b) && computeAngle(d, a, b) == computeAngle(a, b, c))) {
        return true;
    }
    else return false;
}

bool isRectangle(Point a, Point b, Point c, Point d) {
    if (distance(a, b) == distance(c, d) && distance(b, c) == distance(a, d) && distance(a, b) != distance(b, c) && distance(a, d) != distance(c, d)) {
        if (computeAngle(a, b, c) == computeAngle(c, d, a) && computeAngle(b, c, d) == computeAngle(d, a, b) && computeAngle(d, a, b) == computeAngle(a, b, c))
            return true;
        else return false;
    }
    else return false;
}

bool isQuadrilateral(Point a, Point b, Point c, Point d) {
    if (crossProduct(a, b, c) == 0 || crossProduct(b, c, d) == 0 || crossProduct(c, d, a) == 0 || crossProduct(d, a, b) == 0)
    {
        return true;
    }
    else return false;
}


int main() {
    setlocale(0, "");
    Point a, b, c, d;
    int k = 0;

    cout << "������� ���������� ����� A: ";
    while (!(cin >> a.x))
    {
        cout << "������������ ����. ���������� ��� ���.\n";
        cin.clear();
        cin.ignore(numeric_limits<streamsize>::max(), '\n');
    }

    while (!(cin >> a.y))
    {
        cout << "������������ ����. ���������� ��� ���.\n";
        cin.clear();
        cin.ignore(numeric_limits<streamsize>::max(), '\n');
    }

    cout << "������� ���������� ����� B: ";
    while (!(cin >> b.x))
    {
        cout << "������������ ����. ���������� ��� ���.\n";
        cin.clear();
        cin.ignore(numeric_limits<streamsize>::max(), '\n');
    }

    while (!(cin >> b.y))
    {
        cout << "������������ ����. ���������� ��� ���.\n";
        cin.clear();
        cin.ignore(numeric_limits<streamsize>::max(), '\n');
    }

    cout << "������� ���������� ����� C: ";
    while (!(cin >> c.x))
    {
        cout << "������������ ����. ���������� ��� ���.\n";
        cin.clear();
        cin.ignore(numeric_limits<streamsize>::max(), '\n');
    }

    while (!(cin >> c.y))
    {
        cout << "������������ ����. ���������� ��� ���.\n";
        cin.clear();
        cin.ignore(numeric_limits<streamsize>::max(), '\n');
    }

    cout << "������� ���������� ����� D: ";
    while (!(cin >> d.x))
    {


        cout << "������������ ����. ���������� ��� ���.\n";
        cin.clear();
        cin.ignore(numeric_limits<streamsize>::max(), '\n');

    }

    while (!(cin >> d.y)) {


        cout << "������������ ����. ���������� ��� ���.\n";
        cin.clear();
        cin.ignore(numeric_limits<streamsize>::max(), '\n');

    }

 
if (a.x > 50 || a.x < -50 || b.x > 50 || b.x < -50 || c.x > 50 || c.x < -50 || d.x >50 || d.x < -50 || a.y > 50 || a.y < -50 || b.y > 50 || b.y < -50 || c.y > 50 || c.y < -50 || d.y >50 || d.y < -50)
    cout << "�������� ��� ��������� �� -50 �� 50 !!!";
else
{
    double sumOfAngles = (computeAngle(a, b, c) + computeAngle(b, c, d) + computeAngle(c, d, a) + computeAngle(d, a, b));
    sumOfAngles *= (180.0 / 3.1415926535);
    if (abs(sumOfAngles - 360) > 0.01) {
        cout << "������ ����� �� �������� ���������������, �� ����� ����� �� ����� 360.\n";
    }
    else if (a.x == b.x && a.y == b.y || a.x == c.x && a.y == c.y || a.x == d.x && a.y == d.y ||
        b.x == c.x && b.y == c.y || b.x == d.x && b.y == d.y || c.x == d.x && c.y == d.y) {
        cout << "������ ����� �� �������� ���������������, �� ��������� ����� ����� ���������� ����������\n" << endl;
    }
    else if (isQuadrilateral(a, b, c, d)) cout << "������ ����� �� �������� ���������������, �� 3 ����� ����� �� ����� ������" << endl;

    else if (isSquare(a, b, c, d)) {
        cout << "������ ����� �������� �������.\n";
    }
    else if (isRhombus(a, b, c, d)) {
        cout << "������ ����� �������� ����.\n";
    }
    else if (isParallelogram(a, b, c, d)) {
        cout << "������ ����� �������� ��������������.\n";
    }
    else if (isRectangle(a, b, c, d)) {
        cout << "������ ����� �������� �������������.\n";
    }
    else {
        cout << "������ ����� �������� ��������������� ������ ����.\n";
    }
}


return 0;
}