# This file was generated by GoReleaser. DO NOT EDIT.
class Ghput < Formula
  desc "ghput is a CI-friendly tool that puts * on GitHub."
  homepage "https://github.com/k1LoW/ghput"
  version "0.7.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/k1LoW/ghput/releases/download/v0.7.0/ghput_v0.7.0_darwin_amd64.zip"
    sha256 "8af9e3794883bd510481a16c0faf21beca1e8c463d23b9f199f011de0a32cc54"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/ghput/releases/download/v0.7.0/ghput_v0.7.0_linux_amd64.tar.gz"
      sha256 "84334114c88cb6b33f0a844d08740c437bba3014087c3bd5b6e9a5d8c314f8f9"
    end
  end

  def install
    system './ghput', 'completion', 'bash', '--out', 'ghput.bash'
    system './ghput', 'completion', 'zsh', '--out', 'ghput.zsh'
    bin.install 'ghput'
    bash_completion.install 'ghput.bash' => 'ghput'
    zsh_completion.install 'ghput.zsh' => '_ghput'
  end
end
