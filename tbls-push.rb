# This file was generated by GoReleaser. DO NOT EDIT.
class TblsPush < Formula
  desc "tbls-push is an external subcommand of tbls for pushing schema data (schema.json) to target GitHub repository."
  homepage "https://github.com/k1LoW/tbls-push"
  version "0.2.0"

  if OS.mac?
    url "https://github.com/k1LoW/tbls-push/releases/download/v0.2.0/tbls-push_v0.2.0_darwin_amd64.zip"
    sha256 "ab915fe6e31a12cb85bb02f1bf1e3df2585edfda62c7027034d8c2c5978ebcdf"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/tbls-push/releases/download/v0.2.0/tbls-push_v0.2.0_linux_amd64.tar.gz"
      sha256 "2c67b03b2351d28735c3aaf6c8938d6ee7f42e45d896f1278d0d8ef1e55b4845"
    end
  end

  depends_on "tbls"

  def install
    system './tbls-push', 'completion', 'bash', '--out', 'tbls-push.bash'
    system './tbls-push', 'completion', 'zsh', '--out', 'tbls-push.zsh'
    bin.install 'tbls-push'
    bash_completion.install 'tbls-push.bash' => 'tbls-push'
    zsh_completion.install 'tbls-push.zsh' => '_tbls-push'
  end
end
