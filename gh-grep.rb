class GhGrep < Formula
  desc ':octocat: Print lines matching a pattern in repositories using GitHub API'
  version '1.2.6'
  homepage 'https://github.com/k1LoW/gh-grep'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.6/gh-grep_v1.2.6_darwin_arm64.zip'
      sha256 '55bf78fdd1734643b66e9ed9e48b38263d01c53b99f45e805782c9d3bb59bf2b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.6/gh-grep_v1.2.6_darwin_amd64.zip'
      sha256 '128ee24e37c9c6236dead7121c05f7d226862bd9bba3c8198d3914f843f823e4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.6/gh-grep_v1.2.6_linux_arm64.tar.gz'
      sha256 '9b2668865ea42fc144edd6195ecb257468efa88a6f0b4dc48e47a165cabda89e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.6/gh-grep_v1.2.6_linux_amd64.tar.gz'
      sha256 '637414bf865ff59a7fcd41737781dab8f787bd9d7dccb2763e5987edeb2b5485'
    end
  end

  head do
    url 'https://github.com/k1LoW/gh-grep.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gh-grep'
  end
end
