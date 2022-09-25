class HfestRepo < Formula
  desc "hfest-repo is a tool that adds the hacktoberfest topic to every public repository associated with a user or a GitHub org. It can also create the invalid, spam and hacktoberfest-accepted labels in your repos."
  homepage "https://github.com/Hacktoberfest/hacktoberfest-repo-topic-apply"
  version "0.1.1"

  if OS.mac?
    url "https://github.com/Hacktoberfest/hacktoberfest-repo-topic-apply/releases/download/v0.1.1/hfest-repo_0.1.1_darwin_amd64.tar.gz"
    sha256 "dcf2f05692152e1f941b2335a29fa7ed0220e626b32890abd5249155bdf58ed1"
  end

  def install
    bin.install "hfest-repo"
  end
end
