import sys
import os

def comment_block(lines, start_marker, end_marker):
    """
    Comment out blocks between start_marker and end_marker (inclusive).
    """
    output = []
    in_block = False
    for line in lines:
        stripped = line.strip()
        if not in_block and stripped.startswith(start_marker):
            in_block = True
            output.append("// " + line.rstrip())
        elif in_block:
            output.append("// " + line.rstrip())
            if stripped.endswith(end_marker):
                in_block = False
        else:
            output.append(line.rstrip())
    return output

def comment_if0_blocks(lines):
    """
    Comment out all lines in #if 0 ... #endif blocks.
    """
    output = []
    in_if0 = False
    for line in lines:
        stripped = line.strip()
        if stripped.startswith("#if 0"):
            in_if0 = True
            output.append("// " + line.rstrip())
        elif in_if0:
            output.append("// " + line.rstrip())
            if stripped.startswith("#endif"):
                in_if0 = False
        else:
            output.append(line.rstrip())
    return output

def process_c_file(input_path, output_path):
    # Step 1: Read input file
    with open(input_path, "r") as f:
        lines = f.readlines()

    # Step 2: Convert all /* ... */ blocks to // comments
    out1 = []
    in_multiline_comment = False
    for line in lines:
        stripped = line.strip()
        # Start of multiline comment
        if not in_multiline_comment and "/*" in stripped:
            in_multiline_comment = True
            out1.append("// " + line.rstrip())
            # If ends on same line
            if "*/" in stripped and stripped.index("/*") < stripped.index("*/"):
                in_multiline_comment = False
            continue
        elif in_multiline_comment:
            out1.append("// " + line.rstrip())
            if "*/" in stripped:
                in_multiline_comment = False
            continue
        else:
            out1.append(line.rstrip())

    # Step 3: Convert all #if 0 ... #endif blocks to // comments
    out2 = []
    in_if0 = False
    for line in out1:
        stripped = line.strip()
        if stripped.startswith("#if 0"):
            in_if0 = True
            out2.append("// " + line)
        elif in_if0:
            out2.append("// " + line)
            if stripped.startswith("#endif"):
                in_if0 = False
        else:
            out2.append(line)

    # Step 4: Write output file
    with open(output_path, "w") as f:
        for line in out2:
            f.write(line + "\n")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python extractor.py <input_file.c>")
        sys.exit(1)
    input_file = sys.argv[1]
    if not os.path.isfile(input_file):
        print(f"File {input_file} does not exist!")
        sys.exit(1)
    output_file = input_file.replace(".c", "-snippets.c")
    process_c_file(input_file, output_file)
    print(f"Processed: {input_file} -> {output_file}")
