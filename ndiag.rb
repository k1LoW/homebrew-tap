# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Ndiag < Formula
  desc "ndiag is a high-level architecture diagramming/documentation tool."
  homepage "https://github.com/k1LoW/ndiag"
  version "0.14.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/ndiag/releases/download/v0.14.1/ndiag_v0.14.1_darwin_amd64.zip"
      sha256 "99d7ee7da8095fbfa6e8a61a6123334cf893d990b88241120bf18212ea56286c"

      def install
        system './ndiag', 'completion', 'bash', '--out', 'ndiag.bash'
        system './ndiag', 'completion', 'zsh', '--out', 'ndiag.zsh'
        bin.install 'ndiag'
        bash_completion.install 'ndiag.bash' => 'ndiag'
        zsh_completion.install 'ndiag.zsh' => '_ndiag'
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/ndiag/releases/download/v0.14.1/ndiag_v0.14.1_linux_amd64.tar.gz"
      sha256 "11c8d3baab709dcc2d9fb10189a93fa099936f339b4843318849d8c5428a7ddf"

      def install
        system './ndiag', 'completion', 'bash', '--out', 'ndiag.bash'
        system './ndiag', 'completion', 'zsh', '--out', 'ndiag.zsh'
        bin.install 'ndiag'
        bash_completion.install 'ndiag.bash' => 'ndiag'
        zsh_completion.install 'ndiag.zsh' => '_ndiag'
      end
    end
  end
end
