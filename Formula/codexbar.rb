class Codexbar < Formula
  desc "Menu bar usage and status CLI"
  homepage "https://github.com/chanwutk/CodexBar"
  version "0.31.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chanwutk/CodexBar/releases/download/v#{version}/CodexBarCLI-v#{version}-macos-arm64.tar.gz"
      sha256 "611a326fae2c372c6c68b8711aa1d670b977d6d62004ed97f65df72c00082cf3"
    else
      url "https://github.com/chanwutk/CodexBar/releases/download/v#{version}/CodexBarCLI-v#{version}-macos-x86_64.tar.gz"
      sha256 "f2720379f5981cbdb2c93b694767fbd989cbaa384c30bed5e8ca1cef578e3d08"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chanwutk/CodexBar/releases/download/v#{version}/CodexBarCLI-v#{version}-linux-aarch64.tar.gz"
      sha256 "ae6fdf1ab903fe286dba9b03f577ed95de48a83166bff146ad1c06257020bdcf"
    else
      url "https://github.com/chanwutk/CodexBar/releases/download/v#{version}/CodexBarCLI-v#{version}-linux-x86_64.tar.gz"
      sha256 "10a336c2a445c5f2b60912ff959a2b613bc19107a1fbc275e5ccf69b166cf1b1"
    end
  end

  def install
    libexec.install "CodexBarCLI"
    libexec.install "VERSION"
    bin.write_exec_script libexec/"CodexBarCLI"
    bin.install_symlink "CodexBarCLI" => "codexbar"
  end

  test do
    assert_equal "CodexBar #{version}", shell_output("#{bin}/codexbar --version").strip
  end
end
