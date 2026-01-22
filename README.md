# homebrew-ocvwarp
To allow users to install OCVWarp using homebrew - brew.sh

### Via Gemini 3 on aistudio.google.com
To allow users to install OCVWarp using homebrew, you create a **Homebrew Formula**.

Since this is a personal project or a tool not yet famous enough for the official default Homebrew repository (`homebrew/core`), the standard way to distribute this is by creating your own **Homebrew Tap**.

Here is the step-by-step guide to creating the script and hosting it.

### Step 1: The Formula Script

Here is the Ruby code that defines how Homebrew should build the project. Save this code into a file named `ocvwarp.rb`.


### Step 2: How to use it locally (Testing)

Before you share this with others, test it on your machine:

1.  Save the code above as `ocvwarp.rb` in your current folder.
2.  Run the install command pointing to that file:
    ```bash
    brew install --build-from-source ./ocvwarp.rb
    ```
3.  Once finished, try running it:
    ```bash
    ocvwarp
    ```

### Step 3: How to share it with the world (Creating a Tap)

To allow users to run `brew install ocvwarp`, you need to host this file on GitHub.

1.  **Create a new GitHub Repository** named **exactly**: `homebrew-ocvwarp`.
    *   *Note: The prefix `homebrew-` is required by Brew conventions.*
2.  Upload the `ocvwarp.rb` file to the root of that repository.
3.  Push the changes.

### Step 4: Instructions for your users

Now, anyone can install your tool using two commands (or one combined line). You can add this to your project's `README.md`:

**Option A (Two steps):**
```bash
brew tap hn-88/ocvwarp
brew install ocvwarp
```

**Option B (One step):**
```bash
brew install hn-88/ocvwarp/ocvwarp
```

### Explanation of the Script

1.  **`depends_on`**: This tells Homebrew to automatically install `opencv` and `dialog` before trying to build your tool.
2.  **`std_cmake_args`**: This automatically passes flags like `-DCMAKE_INSTALL_PREFIX=/opt/homebrew/Cellar/...`. This ensures the tool is built in a way that Homebrew can manage.
3.  **`bin.install`**: In your manual steps, the file remains in the `build/` folder. This command moves the resulting binary into Homebrew's global `bin` path so it is available anywhere in the terminal. I renamed it from `OCVWarp.bin` to `ocvwarp` because typing `.bin` is not standard on macOS.
