# This file was generated by GoReleaser. DO NOT EDIT.
class Ndiag < Formula
  desc "ndiag is a high-level architecture diagramming/documentation tool."
  homepage "https://github.com/k1LoW/ndiag"
  version "0.0.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/k1LoW/ndiag/releases/download/v0.0.1/ndiag_v0.0.1_darwin_amd64.zip"
    sha256 "388cad3c6e1e1950bde65b378af5acd49742c838b8891ff59f9726a3a6c46220"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/ndiag/releases/download/v0.0.1/ndiag_v0.0.1_linux_amd64.tar.gz"
      sha256 "cbb0d83e40a5df6870a364be39e12d7f9ddd4723a9bd2ce683d99481a7bbd978"
    end
  end

  def install
    system './ndiag', 'completion', 'bash', '--out', 'ndiag.bash'
    system './ndiag', 'completion', 'zsh', '--out', 'ndiag.zsh'
    bin.install 'ndiag'
    bash_completion.install 'ndiag.bash' => 'ndiag'
    zsh_completion.install 'ndiag.zsh' => '_ndiag'
  end
end
