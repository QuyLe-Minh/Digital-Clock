#include <iostream>
#include <string>
#include <cmath>
#include <vector>
#include <unordered_map>
#include <map>
#include <deque>
#include <numeric>
#include <set>

using namespace std;

int getAns(int r, int c){
    if (r <= 1 || c <= 1) return 0;
    int res = min(r, c/2);
    res--;

    res += min(c, r/2);
    res--;
    return res;
}

int helper(int row, int col){
    vector<vector<int>>matr(row, vector<int>(col));
    for (int i = 0; i < row; i++){
        for (int j = 0; j < col; j++){
            cin >> matr[i][j];
        }
    }
    vector<vector<int>> u(row, vector<int>(col,0));
    vector<vector<int>> d(row, vector<int>(col,0));
    vector<vector<int>> l(row, vector<int>(col,0));
    vector<vector<int>> r(row, vector<int>(col,0));

    //up
    for (int j = 0; j < col; j++){
        for (int i = row-1; ~i; i--){
            if (matr[i][j]){
                u[i][j]++;
                if (i < row-1){
                    u[i][j] = u[i][j] + u[i+1][j];
                }
            }
        }
    }
    //down
    for (int j = 0; j < col; j++){
        for (int i = 0; i < row; i++){
            if (matr[i][j]){
                d[i][j]++;
                if (i > 0){
                    d[i][j] = d[i][j] + d[i-1][j];
                }
            }
        }
    }
    //left
    for (int i = 0; i < row; i++){
        for (int j = 0; j < col; j++){
            if (matr[i][j]){
                l[i][j]++;
                if (j > 0){
                    l[i][j] = l[i][j] + l[i][j-1];
                }
            }
        }
    }

    //right
    for (int i = 0; i < row; i++){
        for (int j = col-1; ~j; j--){
            if (matr[i][j]){
                r[i][j]++;
                if (j < col-1){
                    r[i][j] = r[i][j] + r[i][j+1];
                }
            }
        }
    }
    int ans = 0;
    for (int i = 0; i < row; i++){
        for (int j = 0; j < col; j++){
            if (!matr[i][j]) continue;
            ans+= getAns(u[i][j], r[i][j]);
            ans += getAns(u[i][j], l[i][j]);
            ans += getAns(d[i][j], r[i][j]);
            ans += getAns(d[i][j], l[i][j]);
        }
    }return ans;

}


int main(){
    ios::sync_with_stdio(0);
	cin.tie(0);
    int t;
    cin >> t;
    for (int i = 0; i < t; i++){
        int r, c;
        cin >> r >> c;
        int res = helper(r, c);
        cout << "Case #" << to_string(i+1) << ": " << res << endl;
    }return 0;
}
