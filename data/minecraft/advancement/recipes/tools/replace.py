import os


def rewrite_all_files_content():
    # 获取当前脚本文件的名称，避免修改自身
    script_name = os.path.basename(__file__)

    # 获取当前目录下的所有文件（排除文件夹）
    current_dir = os.getcwd()
    files_to_process = []

    for item in os.listdir(current_dir):
        item_path = os.path.join(current_dir, item)
        # 只处理文件，且排除脚本自身
        if os.path.isfile(item_path) and item != script_name:
            files_to_process.append(item_path)

    if not files_to_process:
        print("当前目录下没有可处理的文件！")
        return

    # 显示待处理文件列表
    print("即将修改以下文件的内容：")
    for file_path in files_to_process:
        print(f"  - {file_path}")

    # 获取用户输入的目标内容
    print(
        "\n请输入要统一写入所有文件的内容（输入完成后按回车，然后按 Ctrl+D(Linux/Mac) 或 Ctrl+Z+回车(Windows) 结束输入）：")
    try:
        # 读取多行输入
        target_content = []
        while True:
            line = input()
            target_content.append(line)
    except EOFError:
        # 将列表拼接成字符串，保留换行符
        target_content = '\n'.join(target_content)

    # 确认操作
    confirm = input(f"\n确认要将以上 {len(files_to_process)} 个文件的内容全部替换为你输入的内容吗？(y/n): ")
    if confirm.lower() != 'y':
        print("操作已取消！")
        return

    # 开始写入文件
    success_count = 0
    fail_count = 0
    failed_files = []

    print("\n开始写入文件...")
    for file_path in files_to_process:
        try:
            # 以写入模式打开文件（会覆盖原有内容）
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(target_content)
            success_count += 1
            print(f"✅ 成功修改: {file_path}")
        except Exception as e:
            fail_count += 1
            failed_files.append((file_path, str(e)))
            print(f"❌ 失败修改: {file_path} - 原因: {e}")

    # 输出结果汇总
    print("\n===== 操作完成 =====")
    print(f"成功修改: {success_count} 个文件")
    print(f"失败修改: {fail_count} 个文件")
    if failed_files:
        print("失败文件列表：")
        for file_path, error in failed_files:
            print(f"  - {file_path}: {error}")


if __name__ == "__main__":
    rewrite_all_files_content()