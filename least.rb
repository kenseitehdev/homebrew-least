class Least < Formula
  desc "A Lightweight less Alternative for Code Browsing"
  homepage "https://github.com/kenseitehdev/Least"
  url "https://github.com/kenseitehdev/Least/archive/refs/tags/0.7.tar.gz"
  sha256 "771d7d086401b570a5f8a1538c3f3ed5ab1987a53d7fb0f9db3ed284b5c98fc9"
  license "MIT"

  depends_on "ncurses"

  # For multiple architectures, you can make use of this
  def install
    # Handle architecture-specific installation
    if Hardware::CPU.arm?  # If ARM architecture (e.g., Apple Silicon)
      # Modify flags or installation steps specific to ARM architecture
      system "make", "all", "CFLAGS=-arch arm64"
    elsif Hardware::CPU.intel?  # If Intel architecture (e.g., Intel x86_64)
      # Modify flags or installation steps specific to x86_64
      system "make", "all", "CFLAGS=-arch x86_64"
    else
      # Handle any other architectures if needed
      system "make", "all"
    end

    # Install the binary
    bin.install "bin/least"
  end

  test do
    system "#{bin}/least", "--version"
  end
end
