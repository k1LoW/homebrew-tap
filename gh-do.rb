class GhDo < Formula
  desc ':octocat: gh-do is a tool to do anything using GitHub credentials'
  version '0.5.4'
  homepage 'https://github.com/k1LoW/gh-do'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.5.4/gh-do_v0.5.4_darwin_arm64.zip'
      sha256 'cc6bee53e736305cbe0d159fec99f50249f6cab14cf9c43974824c9178b05dad'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.5.4/gh-do_v0.5.4_darwin_amd64.zip'
      sha256 'bf81d93c66ed54ffda62b3336b15d3f054896bdf571a35532e3845715c716d45'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-do/releases/download/v0.5.4/gh-do_v0.5.4_linux_amd64.tar.gz'
      sha256 '59b83790959be3b7e8190d6b5e4b8bb90a1df9b3e3acdd0a0cffe88cada03ba5'
    end
  end

  depends_on 'gh'

  head do
    url 'https://github.com/k1LoW/gh-do.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gh-do'
  end
end
