cmake -B cmake-build-release -S .
cmake --build cmake-build-release --config Release --target CudAD -j4
.\cmake-build-release\Release\CudAD
