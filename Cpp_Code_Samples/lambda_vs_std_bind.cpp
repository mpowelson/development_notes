#include <functional>
#include <iostream>
#include <eigen3/Eigen>

class Bar
{
public:
    Bar(std::function<int(int)> func) : func_(func)
    {
        int i = func_(5);
        // std::cout << "Bar Constructor: " <<  i  << std::endl;
    }
    std::function<int(int)> func_;

};

class Foo
{
private:
    Bar bar_object_;

public:
    int callback(int input) {return input + 1;}

    // Foo() : bar_object_(std::bind(&Foo::callback, this, std::placeholders::_1)) {}
     Foo() : bar_object_([&](int x){return Foo::callback(x);}) {}



};




int main(int argc, char** argv)
{
  Foo test;
  return 0;
}
