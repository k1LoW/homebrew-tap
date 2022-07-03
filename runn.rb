# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Runn < Formula
  desc "runn is a tool for running operations following a scenario."
  homepage "https://github.com/k1LoW/runn"
  version "0.23.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/k1LoW/runn/releases/download/v0.23.0/runn_v0.23.0_darwin_arm64.zip"
      sha256 "4da37952a89e23ec33a811c8d078f3263c8dd55cd8055376444e2e7d2574f6d7"

      def install
        bin.install 'runn'
        output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'bash')
        (bash_completion/'runn').write output
        output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'zsh')
        (zsh_completion/'_runn').write output
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/runn/releases/download/v0.23.0/runn_v0.23.0_darwin_amd64.zip"
      sha256 "da8677d865452a2096e7c598bfa1c2cdc6df65c2b2330c7969b34319811a6665"

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
      url "https://github.com/k1LoW/runn/releases/download/v0.23.0/runn_v0.23.0_linux_amd64.tar.gz"
      sha256 "b7d9c321260d4ca0a1c80e9a67052b3dc27866e59e9e9b9933e2c996dd8cb311"

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
