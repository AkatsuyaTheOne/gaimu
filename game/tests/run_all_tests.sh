#!/bin/bash
# Script to run all tests
# Usage: ./tests/run_all_tests.sh

echo "Running all tests..."
echo "========================================"

echo -e "\nOrganization Test:"
echo "----------------------------------------"
godot --headless -s tests/organization_test.gd

echo -e "\nModule Smoke Test:"
echo "----------------------------------------"
godot --headless -s tests/smoke_test_cli.gd

echo -e "\nScene Generator Test:"
echo "----------------------------------------"
godot --headless -s tests/scene_generator_test.gd

echo -e "\n========================================"
echo "All tests completed!"