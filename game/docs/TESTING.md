# Testing the Project

## Test Organization

All tests are now organized in the `tests/` directory for better maintainability:

```
tests/
├── organization_test.gd      # Verifies file paths are correct
├── smoke_test_cli.gd         # Tests that modules can be loaded
├── scene_generator_test.gd   # Tests scene generation capabilities
├── run_all_tests.gd          # Runs all tests (Godot script)
└── run_all_tests.sh          # Runs all tests (shell script)
```

## Running Individual Tests

You can run individual tests using the Godot command line:

```
# Test file organization
godot --headless -s tests/organization_test.gd

# Test module loading
godot --headless -s tests/smoke_test_cli.gd

# Test scene generation
godot --headless -s tests/scene_generator_test.gd
```

## Running All Tests

You can run all tests at once using either:

```
# Using shell script (Linux/Mac)
./tests/run_all_tests.sh

# Using Godot script
godot --headless -s tests/run_all_tests.gd
```

## Test Descriptions

### Organization Test
Verifies that all scene and script files can be found at their expected paths.

### Module Smoke Test
Verifies that all module scripts can be loaded without errors.

### Scene Generator Test
Tests that the engine can create all the node types needed for scene generation.

## Note on Errors

When running these tests headless, you will see errors related to missing assets and resources. This is normal and expected behavior because:

1. The Godot engine needs to import assets the first time a project is opened in the editor
2. The `.ctex` files (compressed textures) are generated during this import process
3. Scene references to other scenes and assets can't be resolved until the project has been imported

These errors do not indicate problems with the project organization or modular architecture. They simply mean that the project has not yet been opened in the Godot editor for the first time.

To resolve these errors and run the game:
1. Open the project in Godot Engine
2. The editor will automatically import all assets
3. After importing, the project will run correctly