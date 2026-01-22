class Ocvwarp < Formula
  desc "Warping tool using OpenCV"
  homepage "https://github.com/hn-88/OCVWarp"
  license "MIT"
  head "https://github.com/hn-88/OCVWarp.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "dialog"
  depends_on "opencv"

  def install
    # 1. Configure the build
    # -S . : Source is current directory
    # -B build : Build directory is 'build'
    # *std_cmake_args : Passes Homebrew standard flags (install paths, build type, etc.)
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args

    # 2. Compile the specific target
    system "cmake", "--build", "build", "--target", "OCVWarp.bin"

    # 3. Install the binary
    # We rename 'OCVWarp.bin' to 'ocvwarp' so users can just type 'ocvwarp'
    bin.install "build/OCVWarp.bin" => "ocvwarp"
  end

  test do
    # Simple test to check if binary links correctly
    # Since this is a GUI/Interactive tool, we just check if it executes
    # It will likely exit with error (because of no args), which we expect.
    system "#{bin}/ocvwarp", "--help"
  end
end
