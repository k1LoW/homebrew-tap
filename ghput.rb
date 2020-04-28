# This file was generated by GoReleaser. DO NOT EDIT.
class Ghput < Formula
  desc "ghput is a CI-friendly tool that puts * on GitHub."
  homepage "https://github.com/k1LoW/ghput"
  version "0.4.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/k1LoW/ghput/releases/download/v0.4.0/ghput_v0.4.0_darwin_amd64.zip"
    sha256 "d107b81730822dcbed36d169ad58443bd77187b1652d7af6cd47ead20caa9374"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/ghput/releases/download/v0.4.0/ghput_v0.4.0_linux_amd64.tar.gz"
      sha256 "1c38d4df0afcc0bd42ffe9c3851e368115cca631d7c602183371091a801a992f"
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
