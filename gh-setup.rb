class GhSetup < Formula
  desc ':octocat: Setup asset of Github releases.'
  version '1.11.7'
  homepage 'https://github.com/k1LoW/gh-setup'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.7/gh-setup_v1.11.7_darwin_arm64.zip'
      sha256 '2f29cbf7fbf719c6f8babfc6022154981a91f597a89ae8110b91035da6417f26'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.7/gh-setup_v1.11.7_darwin_amd64.zip'
      sha256 'b1fc2784fe07d08f755a9640ad971544e184b7d7721874b0811ac7e985a62377'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-setup/releases/download/v1.11.7/gh-setup_v1.11.7_linux_amd64.tar.gz'
      sha256 '6cddf8fc84b02872d04858c8665afc9c9b6a017cc1f7c18ec9bcf8d8b47e3343'
    end
  end

  head do
    url 'https://github.com/k1LoW/gh-setup.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gh-setup'
  end
end
