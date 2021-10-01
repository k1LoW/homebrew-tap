class HfestRepo < Formula
  desc "hfest-repo is a tool that adds the hacktoberfest topic to every public repository associated with a user or a GitHub org. It can also create the invalid, spam and hacktoberfest-accepted labels in your repos."
  homepage "https://github.com/Hacktoberfest/hacktoberfest-repo-topic-apply"
  version "0.0.10"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/Hacktoberfest/hacktoberfest-repo-topic-apply/releases/download/v0.0.10/hfest-repo_0.0.10_darwin_amd64.tar.gz"
    sha256 "e88da7d784ae2a1b02aeeb0ed210cd4bf1d80e13fbd486df4725956014fd399a"
  end

  def install
    bin.install "hfest-repo"
  end
end
