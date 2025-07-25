# defect_patterns.py

# Regular expression to extract pattern type, variable name, and location from defect reports.
PATTERN_REGEX = r"Defect_Pattern:\s*(RWW|WWR|RWR|WRW)\s*\nVariable:\s*(\w+)\s*\nLocation:\s*([^\n]+)\s*\nDescription:.*"

# Meta information for each atomicity violation pattern.
# Each entry corresponds to a specific pattern with:
#   - pattern_name: Human-readable name, used for prompt filling.
#   - pattern_example: The markdown filename (under prompt/expert/) with the example and explanation for this pattern.
#   - access_pattern: The sequence of accesses (Read/Write) that defines this pattern.
PATTERNS = {
    "RWW": {
        "pattern_name": "<Read, Write, Write>",
        "domain_knowledge": "rww.md",
        "pattern_example": "rww_example.md",
        "access_pattern": ["Read", "Write", "Write"]
    },
    "WWR": {
        "pattern_name": "<Write, Write, Read>",
        "domain_knowledge": "wwr.md",
        "pattern_example": "wwr_example.md",
        "access_pattern": ["Write", "Write", "Read"]
    },
    "RWR": {
        "pattern_name": "<Read, Write, Read>",
        "domain_knowledge": "rwr.md",
        "pattern_example": "rwr_example.md",
        "access_pattern": ["Read", "Write", "Read"]
    },
    "WRW": {
        "pattern_name": "<Write, Read, Write>",
        "domain_knowledge": "wrw.md",
        "pattern_example": "wrw_example.md",
        "access_pattern": ["Write", "Read", "Write"]
    }
}

def get_pattern_info(pattern_code):
    """
    Retrieve the meta information for a specific atomicity violation pattern.

    Args:
        pattern_code (str): The code of the pattern (e.g., "RWW", "WWR", "RWR", "WRW".)

    Returns:
        dict or None: The pattern info dictionary if found, else None.
    Example:
        info = get_pattern_info("RWW")
    """
    return PATTERNS.get(pattern_code)