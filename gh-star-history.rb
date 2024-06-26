# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class GhStarHistory < Formula
  desc "Show star history of repositories."
  homepage "https://github.com/k1LoW/gh-star-history"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/k1LoW/gh-star-history/releases/download/v0.2.4/gh-star-history_v0.2.4_darwin_arm64.zip"
      sha256 "d6411c181d201ad1281ca59e91dbafdd018de0f3a8569b96f6dc4ebb1352f63f"

      def install
        bin.install "gh-star-history"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/gh-star-history/releases/download/v0.2.4/gh-star-history_v0.2.4_darwin_amd64.zip"
      sha256 "a9e2f719af9c736b2888d6bb30776a4853ee474cb0d000d4eacb8199816fd95d"

      def install
        bin.install "gh-star-history"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/k1LoW/gh-star-history/releases/download/v0.2.4/gh-star-history_v0.2.4_linux_amd64.tar.gz"
      sha256 "7a09fdd617632da16203aea5f21c3558bdeeb4163fa7e69f622c00ed037a9476"

      def install
        bin.install "gh-star-history"
      end
    end
  end
end
