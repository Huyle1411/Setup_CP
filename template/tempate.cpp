#include "bits/stdc++.h"
using namespace std;

void DEBUGLOCAL() { cerr << ")" << '\n'; }
template <class A, class... B>
void DEBUGLOCAL(A argc, B... argv)
{
    cerr << argc;
    if (sizeof...(argv))
        cerr << ", ";
    DEBUGLOCAL(argv...);
}
#ifdef _DEBUG
#define dbg(...) cerr << "LINE(" << __LINE__ << ") [" << __FUNCTION__ << "] -> (" << #__VA_ARGS__ << "): (", DEBUGLOCAL(__VA_ARGS__)
#else
#define dbg(...) 0
#endif

int main()
{
    ios::sync_with_stdio(0);
    cin.tie(0);

    int TC;
    cin >> TC;
    while (TC--)
    {
    }
}