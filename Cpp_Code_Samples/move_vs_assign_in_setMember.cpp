#include <functional>
#include <iostream>
#include <memory>

struct Bar
{
    Bar(int& input) : member1(input) {};
    int member1;
};


class Foo
{
public:
    void setBarMember1(const std::shared_ptr<Bar> input_bar) {bar_member = input_bar;}
    void setBarMember2(const std::shared_ptr<Bar> input_bar) {bar_member = std::move(input_bar);}
    void setBarMember3(std::shared_ptr<Bar> input_bar) {bar_member = input_bar;}
    void setBarMember4(std::shared_ptr<Bar> input_bar) {bar_member = std::move(input_bar);}

     Foo() = default;

private:
std::shared_ptr<Bar> bar_member;

};




int main(int argc, char** argv)
{
    int one = 1;
    int two = 2;
    int three = 3;
    int four = 5;

  auto bar1 = std::make_shared<Bar>(one);
  auto bar2 = std::make_shared<Bar>(two);
  auto bar3 = std::make_shared<Bar>(three);
  auto bar4 = std::make_shared<Bar>(four);

  Foo foo;
  foo.setBarMember1(bar1);
  foo.setBarMember2(bar2);
  foo.setBarMember3(bar3);
  foo.setBarMember4(bar4);
  return 0;
}
