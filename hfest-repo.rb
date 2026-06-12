class HfestRepo < Formula
  desc "hfest-repo is a tool that adds the hacktoberfest topic to every public repository associated with a user or a GitHub org. It can also create the invalid, spam and hacktoberfest-accepted labels in your repos."
  homepage "https://github.com/Hacktoberfest/hacktoberfest-repo-topic-apply"
  version "0.1.1"

  on_macos do
    # Only an amd64 darwin artifact is published; Apple Silicon runs it via Rosetta.
    if Hardware::CPU.arm? || Hardware::CPU.intel?
      url "https://github.com/Hacktoberfest/hacktoberfest-repo-topic-apply/releases/download/v0.1.1/hfest-repo_0.1.1_darwin_amd64.tar.gz"
      sha256 "dcf2f05692152e1f941b2335a29fa7ed0220e626b32890abd5249155bdf58ed1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Hacktoberfest/hacktoberfest-repo-topic-apply/releases/download/v0.1.1/hfest-repo_0.1.1_linux_arm64.tar.gz"
      sha256 "88eca0345bc33686384376ce3c60edb25b1bd5140ab0f1f7944f1e32ab1f244d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Hacktoberfest/hacktoberfest-repo-topic-apply/releases/download/v0.1.1/hfest-repo_0.1.1_linux_amd64.tar.gz"
      sha256 "147aacac0287d4b56f5244ac3f8d08d6384768e3c6a288e9277de171085be6ec"
    end
  end

  def install
    bin.install "hfest-repo"
  end
end
