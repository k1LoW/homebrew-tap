# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Octocov < Formula
  desc "octocov is a toolkit for collecting code metrics."
  homepage "https://github.com/k1LoW/octocov"
  version "0.41.0"
  license "MIT"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/k1LoW/octocov/releases/download/v0.41.0/octocov_v0.41.0_darwin_arm64.zip"
      sha256 "900d4ffd6760b2860c9807e7fd9ee76302ed4149d07f65c811fbf06a0aaf1f82"

      def install
        bin.install 'octocov'
        output = Utils.safe_popen_read("#{bin}/octocov", 'completion', 'bash')
        (bash_completion/'octocov').write output
        output = Utils.safe_popen_read("#{bin}/octocov", 'completion', 'zsh')
        (zsh_completion/'_octocov').write output
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/octocov/releases/download/v0.41.0/octocov_v0.41.0_darwin_amd64.zip"
      sha256 "083c579113e3e98ed61ca89951fdf219d7f8537d1ff9b5cb77dae21c5ad8864e"

      def install
        bin.install 'octocov'
        output = Utils.safe_popen_read("#{bin}/octocov", 'completion', 'bash')
        (bash_completion/'octocov').write output
        output = Utils.safe_popen_read("#{bin}/octocov", 'completion', 'zsh')
        (zsh_completion/'_octocov').write output
      end
    end
  end
end
