# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Runn < Formula
  desc "runn is a tool for running operations following a scenario."
  homepage "https://github.com/k1LoW/runn"
  version "0.22.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/k1LoW/runn/releases/download/v0.22.3/runn_v0.22.3_darwin_arm64.zip"
      sha256 "6dfa00ec51cc6f11e2b005e724874f45fe31499c19c812b7817abe64ac3dcacc"

      def install
        bin.install 'runn'
        output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'bash')
        (bash_completion/'runn').write output
        output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'zsh')
        (zsh_completion/'_runn').write output
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/runn/releases/download/v0.22.3/runn_v0.22.3_darwin_amd64.zip"
      sha256 "87a0a406d2f1b05e2b35a698cd1d23d8d4d1bff48d8c3c54a602eb3b8bcc4842"

      def install
        bin.install 'runn'
        output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'bash')
        (bash_completion/'runn').write output
        output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'zsh')
        (zsh_completion/'_runn').write output
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/runn/releases/download/v0.22.3/runn_v0.22.3_linux_amd64.tar.gz"
      sha256 "9cba47ad9575f5b989790cfe5697e596ab6d115565e3929f1b3837a7aa49bece"

      def install
        bin.install 'runn'
        output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'bash')
        (bash_completion/'runn').write output
        output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'zsh')
        (zsh_completion/'_runn').write output
      end
    end
  end
end
