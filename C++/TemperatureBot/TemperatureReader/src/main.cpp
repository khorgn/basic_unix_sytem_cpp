#include "TemperatureData.hpp"
#include "TemperatureReader.hpp"

#include <iostream>
#include <experimental/filesystem>

namespace fs = std::experimental::filesystem;

int main()
{
    std::cout << "START" << std::endl;
    TemperatureBot::TemperatureReader tpr;

    fs::path currPath = fs::current_path();
    currPath = currPath.parent_path();
    currPath = currPath / "TemperatureReader" / "resources" / "test1.xml";
    // TCHAR NPath[1024];
    // GetCurrentDirectory(1024, NPath);
    std::cout << "START Current directory" << '\n';
    // std::wcout << NPath << std::endl;
    std::cout << currPath.c_str() << '\n';
    std::cout << "END Current directory" << '\n';



    std::cout << "START Read file" << std::endl;
    // tpr.RecoverData(std::ifstream("test1.xml"));
    std::string path_str = currPath.string();
    tpr.RecoverData(path_str);
    std::cout << "END Read file" << std::endl;

    return 0;
}
