import os
import sys
import importlib.util

def main():
    print("开始调试MCP模块加载")
    
    # 检查当前工作目录
    cwd = os.getcwd()
    print(f"当前工作目录: {cwd}")
    
    # 构建模块路径
    module_path = os.path.abspath("./tool/Read_Write_Analyzer/analyzer.py")
    print(f"模块路径: {module_path}")
    print(f"模块文件是否存在: {os.path.exists(module_path)}")
    
    # 检查模块所在目录
    module_dir = os.path.dirname(module_path)
    print(f"模块所在目录: {module_dir}")
    print(f"模块所在目录是否存在: {os.path.exists(module_dir)}")
    
    # 列出模块所在目录的文件
    if os.path.exists(module_dir):
        print(f"模块所在目录文件列表: {os.listdir(module_dir)}")
    
    try:
        # 动态加载模块
        print("尝试加载模块...")
        spec = importlib.util.spec_from_file_location("analyzer", module_path)
        if spec is None:
            print(f"无法创建spec，模块路径可能有问题: {module_path}")
            return
        
        module = importlib.util.module_from_spec(spec)
        sys.modules["analyzer"] = module
        print(f"执行模块: {module}")
        spec.loader.exec_module(module)
        
        # 检查模块是否包含analyze_rw函数
        if hasattr(module, "analyze_rw"):
            print("模块包含analyze_rw函数")
            analyze_rw = getattr(module, "analyze_rw")
            
            # 检查函数是否有MCP装饰器
            if hasattr(analyze_rw, "is_mcp_tool") and analyze_rw.is_mcp_tool:
                print("analyze_rw函数有MCP装饰器")
                print(f"tool_name: {analyze_rw.tool_name}")
                print(f"tool_description: {analyze_rw.tool_description}")
            else:
                print("analyze_rw函数没有MCP装饰器")
        else:
            print("模块不包含analyze_rw函数")
        
    except Exception as e:
        print(f"加载模块异常: {str(e)}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main() 