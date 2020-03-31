class Frgm < Formula
  desc "frgm is a command snippets (fragments) manager."
  homepage "https://github.com/k1LoW/frgm"
  version "0.0.2"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/k1LoW/frgm/releases/download/v0.0.2/frgm_v0.0.2_darwin_amd64.zip"
    sha256 "8998bb98b4e77dee2a614fa0cac53289757957a4a923883d96b6cb8a6358e7ec"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/frgm/releases/download/v0.0.2/frgm_v0.0.2_linux_amd64.tar.gz"
      sha256 "9cd8537e6cbf2bf2ce940eb94f9f71ccd1dab7150696f82b7b5b1469526d0e87"
    end
  end

  def install
    system './frgm', 'completion', 'bash', '--out', 'frgm.bash'
    system './frgm', 'completion', 'zsh', '--out', 'frgm.zsh'
    bin.install 'frgm'
    bash_completion.install 'frgm.bash' => 'frgm'
    zsh_completion.install 'frgm.zsh' => '_frgm'
  end
end
