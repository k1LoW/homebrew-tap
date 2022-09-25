class Tcpdp < Formula
  desc "tcpdp is TCP dump tool with custom dumper and structured logger written in Go."
  homepage "https://github.com/k1LoW/tcpdp"
  version "0.22.2"

  url "https://github.com/k1LoW/tcpdp/releases/download/v0.22.2/tcpdp_v0.22.2_darwin_amd64.tar.gz"
  sha256 "b60ba68b5d0144fe95152b933d9eda1c336d715dde1ccb54209c528982e708d1"

  def install
    bin.install 'tcpdp'
  end
end

