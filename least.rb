class Least < Formula
  desc "A Lightweight less Alternative for Code Browsing"
  homepage "https://github.com/kenseitehdev/Least"
  url "https://github.com/kenseitehdev/Least/archive/refs/tags/0.4.tar.gz"
  sha256 "1ad3cacba5cf18e6e56622ac2fb41b1f97e4a23ce4f9215986de8be264507ad9"
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
