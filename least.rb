class Least < Formula
  desc "A Lightweight less Alternative for Code Browsing"
  homepage "https://github.com/kenseitehdev/Least"
  url "https://github.com/kenseitehdev/Least/archive/refs/tags/0.3.tar.gz"
  sha256 "7f159e195e6b64a9e6c18570cef87ff2e3ee595e8a3b2960bbf0120b33c953e5"
  license "MIT"

  depends_on "ncurses"

  def install
    # Make the necessary directories
    system "make", "all"  # Runs the Makefile's default target
    bin.install "bin/least"  # Installs the least binary to the bin directory
  end

  test do
    system "#{bin}/least", "--version"
  end
end
