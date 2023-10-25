#include <iostream>
#include <unordered_map>
#include <string>
#include <vector>
#include <algorithm>

std::unordered_map<std::string, unsigned long long> Stat;

namespace {
    void updateStatistic(std::string Instr) {
        auto &CurStat = Stat[Instr];
        ++CurStat;
    }
}

extern "C" {

void logInstr(char *Instr) {
    printf("[LOG] %s\n", Instr);
    updateStatistic(Instr);
}

void dropStat() {
    std::vector<std::pair<std::string, unsigned long long>> Result(Stat.begin(), Stat.end());
    std::sort(Result.begin(), Result.end(), [](const auto &X, const auto &Y) {return X.second < Y.second; });

    for (auto &&Elem : Result)
        std::cout << Elem.first << " --- " << Elem.second << std::endl;
}

}