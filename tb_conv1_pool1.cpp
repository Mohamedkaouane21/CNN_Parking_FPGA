#include <iostream>
#include <fstream>
#include <vector>
#include <cmath>
#include <algorithm>

extern "C" void conv1_pool1(const float* in, const float* w, const float* b, float* out);

static bool read_f32_file(const std::string& path, std::vector<float>& v, size_t count) {
    std::ifstream f(path, std::ios::binary);
    if (!f) return false;
    v.resize(count);
    f.read(reinterpret_cast<char*>(v.data()), count * sizeof(float));
    return (bool)f;
}

int main() {
    const std::string IN   = "input_48x48.bin";
    const std::string W    = "fpga_weights/00_conv2d_w0.bin";
    const std::string B    = "fpga_weights/00_conv2d_w1.bin";
    const std::string GOLD = "golden_pool1.bin";

    std::vector<float> in, w, b, out, gold;

    if (!read_f32_file(IN, in, 48*48)) { std::cerr << "Missing " << IN << "\n"; return 1; }
    if (!read_f32_file(W,  w,  3*3*1*16)) { std::cerr << "Missing " << W << "\n"; return 1; }
    if (!read_f32_file(B,  b,  16)) { std::cerr << "Missing " << B << "\n"; return 1; }
    if (!read_f32_file(GOLD, gold, 23*23*16)) { std::cerr << "Missing " << GOLD << "\n"; return 1; }

    out.resize(23*23*16);

    conv1_pool1(in.data(), w.data(), b.data(), out.data());

    double max_abs = 0.0;
    double mse = 0.0;
    int worst_i = 0;

    for (int i = 0; i < (int)out.size(); i++) {
        double diff = (double)out[i] - (double)gold[i];
        if (std::abs(diff) > max_abs) { max_abs = std::abs(diff); worst_i = i; }
        mse += diff * diff;
    }
    mse /= out.size();

    std::cout << "Max abs diff: " << max_abs << "\n";
    std::cout << "MSE        : " << mse << "\n";
    std::cout << "Worst idx  : " << worst_i
              << " out=" << out[worst_i] << " gold=" << gold[worst_i] << "\n";

    if (max_abs < 1e-3) { std::cout << "PASS\n"; return 0; }
    std::cout << "FAIL\n"; return 2;
}
