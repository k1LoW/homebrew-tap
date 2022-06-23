class HfestRepo < Formula
  desc "Tool that adds the hacktoberfest topic and labels to GitHub public repositories"
  homepage "https://github.com/Hacktoberfest/hacktoberfest-repo-topic-apply"
  url "https://github.com/Hacktoberfest/hacktoberfest-repo-topic-apply/releases/download/v0.0.10/hfest-repo_0.0.10_darwin_amd64.tar.gz"
  version "0.0.10"
  sha256 "e88da7d784ae2a1b02aeeb0ed210cd4bf1d80e13fbd486df4725956014fd399a"

  depends_on :macos

  def install
    bin.install "hfest-repo"
  end
end
