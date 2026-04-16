mylib/
├── xmake.lua          # 构建配置文件
├── include/           # 公共头文件（对外暴露的 API）
│   └── mylib.h
├── src/               # 源代码实现
│   ├── mylib.c        # 或 .cpp
│   └── internal.h     # 内部私有头文件（可选）
├── test/              # 测试程序（可选，用于验证库）
│   ├── test.cpp
│   └── xmake.lua      # 测试子项目的配置
└── README.md