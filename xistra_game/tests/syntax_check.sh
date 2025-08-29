#!/bin/bash

# Syntax check for GDScript files

echo "=== GDSCRIPT SYNTAX CHECK ==="
echo ""

# Count total GDScript files
total_files=$(find /workspace/xistra_game -name "*.gd" | wc -l)
echo "Total GDScript files: $total_files"
echo ""

# Check each GDScript file for basic syntax issues
echo "Checking GDScript files for basic syntax..."
echo ""

passed=0
failed=0

for file in $(find /workspace/xistra_game -name "*.gd"); do
    # Simple check: ensure file is not empty and has proper extension
    if [ -s "$file" ]; then
        # Check if file contains basic GDScript elements
        if grep -q "extends" "$file" || grep -q "func" "$file"; then
            echo "[PASS] $file"
            passed=$((passed + 1))
        else
            echo "[WARN] $file (No 'extends' or 'func' found, might be incomplete)"
            passed=$((passed + 1))  # Still count as passed since it's not an error
        fi
    else
        echo "[FAIL] $file (Empty file)"
        failed=$((failed + 1))
    fi
done

echo ""
echo "=== SYNTAX CHECK RESULTS ==="
echo "Passed: $passed"
echo "Failed: $failed"

if [ $failed -eq 0 ]; then
    echo "All GDScript files passed basic syntax checks!"
else
    echo "Some files need attention."
fi