class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.6.0'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.6.0/octoslack_v0.6.0_darwin_arm64.zip'
      sha256 '9c38dd0d2ba12c6df5089c218b3b00de4ac5060b3199df55c95bdf7f8dee45b5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.6.0/octoslack_v0.6.0_darwin_amd64.zip'
      sha256 '197c50d581a6474c41018768e0609ca6eb76371c94f49e9d17c27f90f81350d9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.6.0/octoslack_v0.6.0_linux_amd64.tar.gz'
      sha256 '46e2da922b354d6f569654d6e630cad0e6eafc3738517cd198fb55902a9a52c6'
    end
  end

  head do
    url 'https://github.com/k1LoW/octoslack.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'octoslack'
  end
end
