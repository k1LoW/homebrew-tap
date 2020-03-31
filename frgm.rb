class Frgm < Formula
  desc "frgm is a command snippets (fragments) manager."
  homepage "https://github.com/k1LoW/frgm"
  version "0.0.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/k1LoW/frgm/releases/download/v0.0.1/frgm_v0.0.1_darwin_amd64.zip"
    sha256 "8bf3eb7f27ea95c516dfaa050aa17b40c5ec9c2507cd5f8bea8782255efd6a3d"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/frgm/releases/download/v0.0.1/frgm_v0.0.1_linux_amd64.tar.gz"
      sha256 "9cdd3e71c2f76c719d7fb8f6c39f9c90dbdf405d5e2e57543f2cc45ce1b7bd1b"
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


