class Tcpdp < Formula
  desc "tcpdp is TCP dump tool with custom dumper and structured logger written in Go."
  homepage "https://github.com/k1LoW/tcpdp"
  version "0.21.2"

  url "https://github.com/k1LoW/tcpdp/releases/download/v0.21.2/tcpdp_v0.21.2_darwin_amd64.tar.gz"
  sha256 "1f437ee10fc60c580b0dbdb440cb889a5575e92d32262f233aad4432aa269f0d"

  def install
    bin.install 'tcpdp'
  end
end

