/**
    CudAD is a CUDA neural network trainer, specific for chess engines.
    Copyright (C) 2022 Finn Eggers

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#include "archs/Alexandria.h"
#include "dataset/shuffle.h"
#include "dataset/writer.h"
#include "misc/config.h"
#include "quantitize.h"
#include "trainer.h"

#include <iostream>
#include <vector>

using namespace std;

int main() {
    init();

    const string data_path = "D:\\giuseppe\\CudAD\\training_data\\";
    const string output    = "D:\\giuseppe\\CudAD\\output\\";

    /********
        convert fen to bin
        *********/

    const string bin_out = "D:\\giuseppe\\CudAD\\training_data\\";

    for (int i = 1; i < 2; i++) {
        std::string filename = data_path + "data" + to_string(i) + ".txt";
        std::cout << filename;
        DataSet ds = read<TEXT>(filename);
        write(bin_out + "data" + to_string(i) + ".bin", ds);
    }

    /********
        Shuffle data
        *********/
    /*
         const string bin_out = "D:\\giuseppe\\CudAD\\training_data\\";
         vector<string> files{};


         for (int i = 1; i <= 2; i++)
          {
             files.push_back(bin_out + "data" + to_string(i) + ".bin");
          }
          mix_and_shuffle_2(files, "shuffled_$.bin", 2);

    */
    std::cout << "AAAAAAAAAAAAAAAAAAAAAA";
    /*
    // Load files
    vector<string> files {};
    for (int i = 1; i <= 2; i++)
        files.push_back(data_path + "shuffled_" + to_string(i) + ".bin");

    Trainer<Alexandria> trainer {};
    trainer.fit(files, vector<string> {data_path + "\\validation\\data1.bin"}, output);

    auto    layers = Alexandria::get_layers();

    Network network {layers};
    network.loadWeights(output + "weights-epoch300.nnue");

    BatchLoader batch_loader {files, 16384};
    batch_loader.start();

    // computeScalars<Alexandria>(batch_loader, network, 1024, Alexandria::Inputs);
    quantitize_shallow(output + "relative.net", network, 64, 256);

    close();
    */
}
