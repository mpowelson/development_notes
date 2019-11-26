#include <functional>
#include <Eigen/Eigen>

class FooMove
{
public:

     FooMove(Eigen::VectorXd input) : member_(std::move(input))
     {
     }

private:
Eigen::VectorXd member_;

};

class FooRef
{
public:

     FooRef(const Eigen::VectorXd& input) : member_(input)
     {
     }

private:
Eigen::VectorXd member_;

};


int main(int argc, char** argv)
{

  Eigen::VectorXd test = Eigen::VectorXd::Zero(6);
  FooMove foo1(test);
  FooRef foo2(test);
  Eigen::VectorXd test2 = test;

  return 0;
}
